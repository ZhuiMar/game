

#import "FBYLineGraphContentView.h"

#import "FBYLineGraphColorView.h"

#define BASE_TAG_COVERVIEW 100
#define BASE_TAG_CIRCLEVIEW 200
#define BASE_TAG_POPBTN 300

@interface FBYLineGraphContentView() {
    
    NSMutableArray *pointArray;
    NSInteger lastSelectedIndex;
}

@end

@implementation FBYLineGraphContentView


- (void)setMaxValue:(CGFloat)maxValue {
    _maxValue = maxValue;
}

- (void)setValueArray:(NSArray *)valueArray {
    _valueArray = valueArray;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        lastSelectedIndex = - 1;
        pointArray = [NSMutableArray array];
        self.yAxis_L = frame.size.height;
        self.xAxis_L = frame.size.width;
        
    }
    return  self;
}

- (void)mapping {
    
    [super mapping];
    
    [self drawChartLine];
    [self drawGradient];
    
    [self setupCircleViews];
    [self setupCoverViews];
}

- (void)reloadDatas {
    
    [super reloadDatas];
    
    [self clearView];
    [self mapping];
}


- (void)drawChartLine
{
    UIBezierPath *pAxisPath = [[UIBezierPath alloc] init];
    
    for (int i = 0; i < self.valueArray.count; i ++) {
        
        CGFloat point_X = self.xScaleMarkLEN * i + self.startPoint.x;
        
        CGFloat value = [self.valueArray[i] floatValue];
        CGFloat percent = value / self.maxValue;
        CGFloat point_Y = self.yAxis_L * (1 - percent) + self.startPoint.y;
        
        CGPoint point = CGPointMake(point_X, point_Y);
        
        [pointArray addObject:[NSValue valueWithCGPoint:point]];
        
        if (i == 0) {
            [pAxisPath moveToPoint:point];
        }
        else {
            [pAxisPath addLineToPoint:point];
        }
    }
    
    CAShapeLayer *pAxisLayer = [CAShapeLayer layer];
    pAxisLayer.lineWidth = 2;
//    pAxisLayer.strokeColor = [UIColor colorWithRed:255/255.0 green:69/255.0 blue:0/255.0 alpha:1].CGColor;
    
    pAxisLayer.strokeColor = [UIColor colorWithHexString:@"#499FFE"].CGColor;
    pAxisLayer.fillColor = [UIColor clearColor].CGColor;
    pAxisLayer.path = pAxisPath.CGPath;
    [self.layer addSublayer:pAxisLayer];
}


- (void)drawGradient {
    
//    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//    gradientLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
//    
//    gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:255/255.0 green:69/255.0 blue:0/255.0 alpha:0.8].CGColor,(__bridge id)[UIColor colorWithWhite:1 alpha:0.1].CGColor];
//    
//    gradientLayer.locations=@[@0.0,@1.0];
//    gradientLayer.startPoint = CGPointMake(0.0,0.0);
//    gradientLayer.endPoint = CGPointMake(0.0,1);
//    
//    UIBezierPath *gradientPath = [[UIBezierPath alloc] init];
//    [gradientPath moveToPoint:CGPointMake(self.startPoint.x, self.yAxis_L + self.startPoint.y)];
//    
//    for (int i = 0; i < pointArray.count; i ++) {
//        [gradientPath addLineToPoint:[pointArray[i] CGPointValue]];
//    }
//    
//    CGPoint endPoint = [[pointArray lastObject] CGPointValue];
//    endPoint = CGPointMake(endPoint.x + self.startPoint.x, self.yAxis_L + self.startPoint.y);
//    [gradientPath addLineToPoint:endPoint];
//    CAShapeLayer *arc = [CAShapeLayer layer];
//    arc.path = gradientPath.CGPath;
//    gradientLayer.mask = arc;
//    [self.layer addSublayer:gradientLayer];
    
}


- (void)setupCircleViews {
    
    for (int i = 0; i < pointArray.count; i ++) {
        
        FBYLineGraphColorView *lineGraphColorView = [[FBYLineGraphColorView alloc] initWithCenter:[pointArray[i] CGPointValue] radius:4];
        lineGraphColorView.tag = i + BASE_TAG_CIRCLEVIEW;
        
//        lineGraphColorView.borderColor = [UIColor colorWithRed:255/255.0 green:69/255.0 blue:0/255.0 alpha:1];
        
        lineGraphColorView.borderColor = [UIColor colorWithHexString:@"#499FFE"];
        
        lineGraphColorView.borderWidth = 1.0;
        [self addSubview:lineGraphColorView];
    }
}


- (void)setupCoverViews {
    
    for (int i = 0; i < pointArray.count; i ++) {
        
        UIView *coverView = [[UIView alloc] init];
        coverView.tag = BASE_TAG_COVERVIEW + i;
        
        if (i == 0) {
            
            coverView.frame = CGRectMake(self.startPoint.x, self.startPoint.y, self.xScaleMarkLEN  / 2, self.yAxis_L);
            [self addSubview:coverView];
        }
        else if (i == pointArray.count - 1 && pointArray.count == self.xMarkTitles.count) {
            CGPoint point = [pointArray[i] CGPointValue];
            coverView.frame = CGRectMake(point.x - self.xScaleMarkLEN / 2, self.startPoint.y, self.xScaleMarkLEN  / 2, self.yAxis_L);
            [self addSubview:coverView];
        }
        else {
            CGPoint point = [pointArray[i] CGPointValue];
            coverView.frame = CGRectMake(point.x - self.xScaleMarkLEN / 2, self.startPoint.y, self.xScaleMarkLEN, self.yAxis_L);
            [self addSubview:coverView];
        }
        UITapGestureRecognizer *gesutre = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gesutreAction:)];
        [coverView addGestureRecognizer:gesutre];
    }
}


- (void)gesutreAction:(UITapGestureRecognizer *)sender {
    
    NSInteger index = sender.view.tag - BASE_TAG_COVERVIEW;
    
    if (lastSelectedIndex != -1) {
        
        FBYLineGraphColorView *lineGraphColorView = (FBYLineGraphColorView *)[self viewWithTag:lastSelectedIndex + BASE_TAG_CIRCLEVIEW];
        lineGraphColorView.borderWidth = 1;
        
        UIButton *lastPopBtn = (UIButton *)[self viewWithTag:lastSelectedIndex + BASE_TAG_POPBTN];
        [lastPopBtn removeFromSuperview];
    }
    
    FBYLineGraphColorView *lineGraphColorView = (FBYLineGraphColorView *)[self viewWithTag:index + BASE_TAG_CIRCLEVIEW];
    lineGraphColorView.borderWidth = 2;
    
    CGPoint point = [pointArray[index] CGPointValue];
    
    UIButton *popBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    popBtn.tag = index + BASE_TAG_POPBTN;
    popBtn.frame = CGRectMake(point.x - 10, point.y - 20, 20, 15);
    
    [popBtn setBackgroundImage:[UIImage imageNamed:@"bgcolors"] forState:UIControlStateNormal];
    
    [popBtn setTitleEdgeInsets:UIEdgeInsetsMake(- 3, 0, 0, 0)];
    popBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    [popBtn setTitle:[NSString stringWithFormat:@"%@",self.valueArray[index]] forState:(UIControlStateNormal)];
    
    [self addSubview:popBtn];
    
    lastSelectedIndex = index;
}


- (void)clearView {
    [self removeSubviews];
    [self removeSublayers];
}

- (void)removeSubviews {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}

- (void)removeSublayers {
    for (CALayer *layer in self.layer.sublayers) {
        [layer removeFromSuperlayer];
    }
}

@end
