
#import "FBYLineGraphView.h"
#import "FBYLineGraphContentView.h"

@interface FBYLineGraphView() {
    
    NSMutableArray *xMarkTitles;
    NSMutableArray *valueArray;
    
}


@property (nonatomic, strong) UILabel *titleLab;


@property (nonatomic, strong) UIScrollView *scrollView;


@property (nonatomic, strong) FBYLineGraphContentView *lineGraphContentView;


@property (nonatomic, strong) NSArray *xMarkTitlesAndValues;

@end

@implementation FBYLineGraphView

- (void)setXScaleMarkLEN:(CGFloat)xScaleMarkLEN {
    _xScaleMarkLEN = xScaleMarkLEN;
}

- (void)setYMarkTitles:(NSArray *)yMarkTitles {
    _yMarkTitles = yMarkTitles;
}

- (void)setMaxValue:(CGFloat)maxValue {
    _maxValue = maxValue;
    
}

- (void)setTitle:(NSString *)title {
    _title = title;
    
}

- (void)setXMarkTitlesAndValues:(NSArray *)xMarkTitlesAndValues titleKey:(NSString *)titleKey valueKey:(NSString *)valueKey {
    
    _xMarkTitlesAndValues = xMarkTitlesAndValues;
    
    xMarkTitles = [NSMutableArray array];
    valueArray = [NSMutableArray array];
    
    for (NSDictionary *dic in xMarkTitlesAndValues) {
        
        [xMarkTitles addObject:[dic objectForKey:titleKey]];
        [valueArray addObject:[dic objectForKey:valueKey]];
    }
}


- (void)mapping {
    
    static CGFloat topToContainView = 0.f;
    
    if (self.title) {
        
        self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, CGRectGetWidth(self.frame), 20)];
        self.titleLab.text = self.title;
        self.titleLab.textColor = [UIColor blackColor];
        self.titleLab.font = [UIFont systemFontOfSize:15];
        self.titleLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.titleLab];
        topToContainView = 25;
    }
    
    if (!self.xMarkTitlesAndValues) {
        
        xMarkTitles = @[@1,@2,@3,@4,@5].mutableCopy;
        valueArray = @[@2,@2,@2,@2,@2].mutableCopy;
        
    }
    
    
    if (!self.yMarkTitles) {
        self.yMarkTitles = @[@0,@1,@2,@3,@4,@5];
    }
    
    
    if (self.maxValue == 0) {
        self.maxValue = 5;
        
    }
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, topToContainView, self.frame.size.width,self.frame.size.height - topToContainView)];
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
    [self.scrollView setShowsVerticalScrollIndicator:NO];
    [self addSubview:self.scrollView];
    
    self.lineGraphContentView = [[FBYLineGraphContentView alloc] initWithFrame:self.scrollView.bounds];
    
    self.lineGraphContentView.yMarkTitles = self.yMarkTitles;
    self.lineGraphContentView.xMarkTitles = xMarkTitles;
    self.lineGraphContentView.xScaleMarkLEN = self.xScaleMarkLEN;
    self.lineGraphContentView.valueArray = valueArray;
    self.lineGraphContentView.maxValue = self.maxValue;
    
    [self.scrollView addSubview:self.lineGraphContentView];
    
    [self.lineGraphContentView mapping];
    
    self.scrollView.contentSize = self.lineGraphContentView.bounds.size;
    
}


- (void)reloadDatas {
    [self.lineGraphContentView reloadDatas];
}

@end
