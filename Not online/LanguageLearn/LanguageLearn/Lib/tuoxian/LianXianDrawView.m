
#import "LianXianDrawView.h"
#import "LianXianBtn.h"
#import "LianXianModel.h"
#import "NSObject+Property.h"



@interface LianXianDrawView()

{
    NSString       *startPointString;
    NSString       *endPointString;
    CGFloat        lineWidth;
    int stateIndex;
    CGPoint myBeginPoint;
}


//@property(nonatomic,strong)NSMutableArray *lineArr;

@end


@implementation LianXianDrawView


- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _pointArr = [[NSMutableArray alloc]init];
        _lineModelArr = [[NSMutableArray alloc]init];
        lineWidth = 3.0f;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{

    CGContextRef context= UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGContextSetLineWidth(context, lineWidth);
    CGContextSetLineJoin(context,kCGLineJoinRound);
    CGContextSetLineCap(context, kCGLineCapRound);
  
    if (_lineModelArr.count > 0) {
        for (int i=0; i <_lineModelArr.count; i++) {
            LianXianModel *model = _lineModelArr[i];
            if (model) {
                CGContextBeginPath(context);
                CGContextMoveToPoint(context, model.startPoint.x, model.startPoint.y);
                CGContextAddLineToPoint(context, model.endPoint.x,model.endPoint.y);
                CGContextSetStrokeColorWithColor(context,[UIColor colorWithHexString:@"#EB2D56"].CGColor);
                CGContextSetLineWidth(context,lineWidth);
                CGContextStrokePath(context);
            }
        }
    }
    
    if ([_pointArr count] > 0) {
        CGContextBeginPath(context);
        CGPoint myStartPoint = CGPointFromString(_pointArr.firstObject);
        CGContextMoveToPoint(context, myStartPoint.x, myStartPoint.y);
        CGPoint myEndPoint = CGPointFromString(_pointArr.lastObject);
        CGContextAddLineToPoint(context, myEndPoint.x,myEndPoint.y);
        CGContextSetStrokeColorWithColor(context,[UIColor colorWithHexString:@"#EB2D56"].CGColor);
        CGContextSetLineWidth(context,lineWidth);
        CGContextStrokePath(context);
    }
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint currentLocation = [touch locationInView:self];
    if(self.startBlock){
        self.startBlock(currentLocation);
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    myBeginPoint = [touch locationInView:self];
    NSString *sPoint = NSStringFromCGPoint(myBeginPoint);
    [_pointArr addObject:sPoint];
    if(_pointArr.count > 1 || [self beginPoint]) {
        [self setNeedsDisplay];
    } else {
        [_pointArr removeAllObjects];
    }
}

- (BOOL)beginPoint
{
    LianXianBtn *beginBtn =  [self judgeTheTouchWhichBtnWithPoint:CGPointFromString(_pointArr.firstObject)];
    
    if(beginBtn != nil){
        if(beginBtn.verticalList == 0 ){
            if( !beginBtn.rightIsConnect)  return YES;
        }else if (beginBtn.verticalList == beginBtn.maxverticalList){
            if( !beginBtn.leftIsConnect) return YES;
        }else{
            if(!beginBtn.leftIsConnect || !beginBtn.rightIsConnect)  return  YES;
        }
    }
    return NO;
}

-(LianXianBtn *)judgeTheTouchWhichBtnWithPoint:(CGPoint)point
{
    for (int i=0; i<self.btnArr.count; i++) {
        LianXianBtn *btn = self.btnArr[i];
        if (CGRectContainsPoint( btn.frame, point)) {
            return btn;
        }
    }
    return nil;
}

- (BOOL)endPoint
{
    if(_pointArr.count) {
        
        LianXianBtn *beginBtn =  [self judgeTheTouchWhichBtnWithPoint:CGPointFromString(_pointArr.firstObject)];
        LianXianBtn *endBtn =  [self judgeTheTouchWhichBtnWithPoint:CGPointFromString(_pointArr.lastObject)];
        
        int minus =  abs(endBtn.verticalList-beginBtn.verticalList);
        if(endBtn != nil && minus == 1)
        {
            if(endBtn.verticalList == 0 )
            {
                if(!endBtn.rightIsConnect) return YES;
           
            }else if (endBtn.verticalList == beginBtn.maxverticalList)
            {
                if( !endBtn.leftIsConnect) return YES;
            }else
            {
                if (!endBtn.leftIsConnect || !endBtn.rightIsConnect)  return YES;
            }
        }
    }
    return NO;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    NSLog(@"touchEnd");
    if([self endPoint]) {
        
        [self addLA];
        
        UITouch *touch = [touches anyObject];
        CGPoint currentLocation = [touch locationInView:self];
        
        if(self.backBlock){
            self.backBlock(currentLocation);
        }
        
    } else {
        [_pointArr removeAllObjects];
        [self setNeedsDisplay];
    }
}

-(BOOL)judgeIsHaveConnectWithPoint:(CGPoint)point
{
    for(LianXianModel *model in self.lineModelArr)
    {
        if(CGPointEqualToPoint(point,model.startPoint) ||
           CGPointEqualToPoint(point,model.endPoint) )
        {
            return YES;
        }
    }
    return NO;
}



-(void)addLA
{
    LianXianModel *model  = [[LianXianModel alloc]init];
    LianXianBtn *beginBtn = [self judgeTheTouchWhichBtnWithPoint:CGPointFromString(_pointArr.firstObject)];
    LianXianBtn *endBtn = [self judgeTheTouchWhichBtnWithPoint:CGPointFromString(_pointArr.lastObject)];
    
    if(beginBtn.center.x < endBtn.center.x)
    {
        model.startPoint = beginBtn.rightCenterPoint;
        model.endPoint = endBtn.leftCenterPoint;
        beginBtn.lianxianModel =  model;
    }
    
    if(beginBtn.center.x > endBtn.center.x)
    {
        model.startPoint = beginBtn.leftCenterPoint;
        model.endPoint = endBtn.rightCenterPoint;
        endBtn.lianxianModel =  model; 
    }
  
    
   if(![self judgeIsHaveConnectWithPoint:model.startPoint] && ![self judgeIsHaveConnectWithPoint:model.endPoint])  //判断两个点都不存在
   {
       model.beginBtn = beginBtn;
       model.endBtn = endBtn;
       
       [_lineModelArr addObject:model];
     
       if(beginBtn.center.x < endBtn.center.x)
       {
           beginBtn.rightIsConnect =  YES;
           endBtn.leftIsConnect = YES;
           [self createTheDeleteBtnWithCenterPoint:beginBtn.rightCenterPoint andLianxianModel:model];
       }
       if(beginBtn.center.x > endBtn.center.x)
       {
           beginBtn.leftIsConnect =  YES;
           endBtn.rightIsConnect = YES;
           [self createTheDeleteBtnWithCenterPoint:endBtn.rightCenterPoint andLianxianModel:model];
       }
   }else
   {
       
   }
    
   [_pointArr removeAllObjects];
   [self setNeedsDisplay];
   
}



-(void)createTheDeleteBtnWithCenterPoint:(CGPoint)point andLianxianModel:(LianXianModel *)model
{
    UIButton *deleteBtn  = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width-20, self.frame.size.height/2-10, 20, 20)];
    //deleteBtn.backgroundColor = [UIColor redColor];
    deleteBtn.center = point;
    [deleteBtn sd_setUserInfo:@{@"btnValue":model}];
    [deleteBtn setImage:[UIImage imageNamed:@"newDeleteImage"] forState:UIControlStateNormal];
    [deleteBtn addTarget:self  action:@selector(deleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:deleteBtn];
    
}

-(void)deleteBtnClick:(UIButton *)btn
{
   
    [btn removeFromSuperview];
    NSDictionary *infoDict = btn.sd_userInfo;
    LianXianModel *btnModel = (LianXianModel *)infoDict[@"btnValue"];
    [self.lineModelArr removeObject:btnModel];

    LianXianBtn *beginBtn  = btnModel.beginBtn;
    LianXianBtn *endBtn  = btnModel.endBtn;
    if(beginBtn.center.x < endBtn.center.x)
    {
        beginBtn.rightIsConnect =  NO;
        endBtn.leftIsConnect = NO;
    }
    
    if(beginBtn.center.x > endBtn.center.x)
    {
        beginBtn.leftIsConnect = NO;
        endBtn.rightIsConnect = NO;
    }
    [self setNeedsDisplay];
}




@end
