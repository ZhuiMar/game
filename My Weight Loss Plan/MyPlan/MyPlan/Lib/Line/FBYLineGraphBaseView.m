
#import "FBYLineGraphBaseView.h"


#define HORIZON_YMARKLAB_YAXISLINE 10.f


#define YMARKLAB_WIDTH 25.f


#define YMARKLAB_HEIGHT 16.f


#define XMARKLAB_WIDTH 40.f


#define XMARKLAB_HEIGHT 16.f


#define YMARKLAB_TO_TOP 12.f

@interface FBYLineGraphBaseView() {
    
    CGFloat axisViewWidth;
   
    CGFloat axisViewHeight;
    
}


@property (nonatomic, assign) CGFloat yScaleMarkLEN;

@end

@implementation FBYLineGraphBaseView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        axisViewHeight = frame.size.height;
        axisViewWidth = frame.size.width;
        CGFloat  start_X = HORIZON_YMARKLAB_YAXISLINE + YMARKLAB_WIDTH;
        CGFloat  start_Y = YMARKLAB_HEIGHT / 2.0 + YMARKLAB_TO_TOP;
        self.startPoint = CGPointMake(start_X, start_Y);
    }
    return self;
}

- (void)setXScaleMarkLEN:(CGFloat)xScaleMarkLEN {
    _xScaleMarkLEN = xScaleMarkLEN;
}

- (void)setYMarkTitles:(NSArray *)yMarkTitles {
    _yMarkTitles = yMarkTitles;
}

- (void)setXMarkTitles:(NSArray *)xMarkTitles {
    _xMarkTitles = xMarkTitles;
}


- (void)mapping {
    
    
    self.yScaleMarkLEN = (self.frame.size.height - YMARKLAB_HEIGHT - XMARKLAB_HEIGHT - YMARKLAB_TO_TOP) / (self.yMarkTitles.count - 1);
    
    self.yAxis_L = self.yScaleMarkLEN * (self.yMarkTitles.count - 1);
    
    if (self.xScaleMarkLEN == 0) {
        self.xScaleMarkLEN = (axisViewWidth - HORIZON_YMARKLAB_YAXISLINE - YMARKLAB_WIDTH - XMARKLAB_WIDTH / 2.0) / (self.xMarkTitles.count - 1);
    }
    else {
        axisViewWidth = self.xScaleMarkLEN * (self.xMarkTitles.count - 1) + HORIZON_YMARKLAB_YAXISLINE + YMARKLAB_WIDTH + XMARKLAB_WIDTH / 2.0;
    }
    
    self.xAxis_L = self.xScaleMarkLEN * (self.xMarkTitles.count - 1);
    
    
    self.frame  = CGRectMake(0, 0, axisViewWidth, axisViewHeight);
    
    [self setupYMarkLabs];
    [self setupXMarkLabs];
    
    [self drawYAxsiLine];
    [self drawXAxsiLine];
    
    [self drawYGridline];
    [self drawXGridline];
}


- (void)reloadDatas {
    [self clearView];
    [self mapping];
}


- (void)setupYMarkLabs {
    for (int i = 0; i < self.yMarkTitles.count; i ++) {
        UILabel *markLab = [[UILabel alloc] initWithFrame:CGRectMake(0, self.startPoint.y - YMARKLAB_HEIGHT / 2 + i * self.yScaleMarkLEN, YMARKLAB_WIDTH, YMARKLAB_HEIGHT)];
        markLab.textAlignment = NSTextAlignmentRight;
        markLab.textColor = [UIColor colorWithHexString:@"#393939"];
        markLab.font = [UIFont fontWithName:FontName size:12];
        markLab.text = [NSString stringWithFormat:@"%@", self.yMarkTitles[self.yMarkTitles.count - 1 - i]];
        [self addSubview:markLab];
    }
}


- (void)setupXMarkLabs {
    
    for (int i = 0;i < self.xMarkTitles.count; i ++) {
        UILabel *markLab = [[UILabel alloc] initWithFrame:CGRectMake(self.startPoint.x - XMARKLAB_WIDTH / 2 + i * self.xScaleMarkLEN, self.yAxis_L + self.startPoint.y + YMARKLAB_HEIGHT / 2, XMARKLAB_WIDTH, XMARKLAB_HEIGHT)];
        markLab.textAlignment = NSTextAlignmentCenter;
        markLab.textColor = [UIColor colorWithHexString:@"#393939"];
        markLab.font = [UIFont fontWithName:FontName size:12];
        markLab.text = self.xMarkTitles[i];
        [self addSubview:markLab];
    }
}


- (void)drawYAxsiLine {
    UIBezierPath *yAxisPath = [[UIBezierPath alloc] init];
    [yAxisPath moveToPoint:CGPointMake(self.startPoint.x, self.startPoint.y + self.yAxis_L)];
    [yAxisPath addLineToPoint:CGPointMake(self.startPoint.x, self.startPoint.y)];
    
    CAShapeLayer *yAxisLayer = [CAShapeLayer layer];
    [yAxisLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:0], nil]];
    yAxisLayer.lineWidth = 2;
    yAxisLayer.strokeColor = [UIColor colorWithHexString:@"#284962"].CGColor;
    yAxisLayer.path = yAxisPath.CGPath;
    [self.layer addSublayer:yAxisLayer];
}


- (void)drawXAxsiLine {
    UIBezierPath *xAxisPath = [[UIBezierPath alloc] init];
    [xAxisPath moveToPoint:CGPointMake(self.startPoint.x, self.yAxis_L + self.startPoint.y)];
    [xAxisPath addLineToPoint:CGPointMake(self.xAxis_L + self.startPoint.x, self.yAxis_L + self.startPoint.y)];
    
    CAShapeLayer *xAxisLayer = [CAShapeLayer layer];
    [xAxisLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:0], nil]];
    xAxisLayer.lineWidth = 2;
    xAxisLayer.strokeColor = [UIColor colorWithHexString:@"#284962"].CGColor;
    xAxisLayer.path = xAxisPath.CGPath;
    [self.layer addSublayer:xAxisLayer];
}


- (void)drawYGridline {
    for (int i = 0; i < self.xMarkTitles.count - 1; i ++) {
        
        CGFloat curMark_X = self.startPoint.x + self.xScaleMarkLEN * (i + 1);
        
        UIBezierPath *yAxisPath = [[UIBezierPath alloc] init];
        [yAxisPath moveToPoint:CGPointMake(curMark_X, self.yAxis_L + self.startPoint.y)];
        [yAxisPath addLineToPoint:CGPointMake(curMark_X, self.startPoint.y)];
        
        CAShapeLayer *yAxisLayer = [CAShapeLayer layer];
        [yAxisLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:1.5], nil]];
        yAxisLayer.lineWidth = 0.5;
        yAxisLayer.strokeColor = [UIColor clearColor].CGColor;
        yAxisLayer.path = yAxisPath.CGPath;
        [self.layer addSublayer:yAxisLayer];
    }
}


- (void)drawXGridline {
    for (int i = 0; i < self.yMarkTitles.count - 1; i ++) {
        
        CGFloat curMark_Y = self.yScaleMarkLEN * i;
        
        UIBezierPath *xAxisPath = [[UIBezierPath alloc] init];
        [xAxisPath moveToPoint:CGPointMake(self.startPoint.x, curMark_Y + self.startPoint.y)];
        [xAxisPath addLineToPoint:CGPointMake(self.startPoint.x + self.xAxis_L, curMark_Y + self.startPoint.y)];
        
        CAShapeLayer *xAxisLayer = [CAShapeLayer layer];
        [xAxisLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:1.5], nil]];
        xAxisLayer.lineWidth = 0.5;
        xAxisLayer.strokeColor = [UIColor clearColor].CGColor;
        xAxisLayer.path = xAxisPath.CGPath;
        [self.layer addSublayer:xAxisLayer];
    }
}


- (void)clearView {
    
    [self removeAllSubLabs];
    [self removeAllSubLayers];
}


- (void)removeAllSubLabs {
    for (UIView * view in self.subviews) {
        if ([view isKindOfClass:[UILabel class]]) {
            [(UILabel *)view removeFromSuperview];
        }
    }
}


- (void)removeAllSubLayers{
    
    for (CALayer * layer in self.layer.sublayers) {
        [layer removeFromSuperlayer];
    }
}


@end
