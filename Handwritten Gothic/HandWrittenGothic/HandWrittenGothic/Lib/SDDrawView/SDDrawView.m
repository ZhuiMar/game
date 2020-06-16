//
//  SDDrawView.m
//  SocketClinetDemo
//
//  Created by bnqc on 2018/6/11.
//  Copyright © 2018 zhuimar. All rights reserved.
//

#import "SDDrawView.h"

@interface SDDrawView()

@property(nonatomic,strong)NSMutableArray <SDBezierPath*>*pathsArray;

@end

@implementation SDDrawView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        _pathsArray = [NSMutableArray arrayWithCapacity:16];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)cleanAction{
    [self.pathsArray removeAllObjects];
    [self setNeedsDisplay];
}
- (void)rollbackAction{
    [self.pathsArray removeLastObject];
    [self setNeedsDisplay];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[touches anyObject];
    CGPoint point=[touch locationInView:touch.view];
    SDBezierPath *path=[SDBezierPath bezierPath];
    path.drawStyle = _drawStyle;
    if(_lineWidth<=0){
        [path setLineWidth:5];
    }else{
        [path setLineWidth:_lineWidth];
    }
    [path setLineColor:_lineColor];
    switch (path.drawStyle) {
        case DrawStyleLine:
            [path moveToPoint:point];
            break;
        case DrawStyleSquare:case DrawStyleCircle:
            [path moveToPoint:point];

            path.startPoint = point;
            break;
        case DrawStyleArrow:
            path.startPoint = point;
            break;
    }
    [self.pathsArray addObject:path];
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[touches anyObject];
    CGPoint point=[touch locationInView:touch.view];
    SDBezierPath *path = self.pathsArray.lastObject;
    switch (path.drawStyle) {
        case DrawStyleLine:
            [path addLineToPoint:point];
            break;
        case DrawStyleSquare:case DrawStyleCircle:
            path.endPoint = point;
            break;
        case DrawStyleArrow:
            path.endPoint = point;
            break;
    }
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    SDBezierPath *path = self.pathsArray.lastObject;
    switch (path.drawStyle) {
        case DrawStyleLine:{
            
            UITouch *touch = [touches anyObject];
            CGPoint point=[touch locationInView:touch.view];
            [[self.pathsArray lastObject] addLineToPoint:point];
            [self setNeedsDisplay];
            
        }break;
        case DrawStyleSquare:case DrawStyleCircle:
            break;
        case DrawStyleArrow:
            break;
    }
}


- (void)drawRect:(CGRect)rect {

    for (SDBezierPath *path in self.pathsArray) {
        
        switch (path.drawStyle) {
            case DrawStyleLine: {
        
                [path.lineColor set];
                [path setLineJoinStyle:kCGLineJoinRound];
                [path setLineCapStyle:kCGLineCapRound];
                [path stroke];
                
            }break;
            case DrawStyleSquare:{
                UIBezierPath *drawPath = [UIBezierPath bezierPathWithRect:CGRectMake(path.startPoint.x, path.startPoint.y, path.endPoint.x - path.startPoint.x, path.endPoint.y - path.startPoint.y)];
                drawPath.lineWidth = path.lineWidth;
                [path.lineColor set];
                [drawPath setLineJoinStyle:kCGLineJoinRound];
                [drawPath setLineCapStyle:kCGLineCapRound];
                [drawPath stroke];
                
            }break;
                
            case DrawStyleCircle: {
                UIBezierPath *drawPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(path.startPoint.x, path.startPoint.y, path.endPoint.x - path.startPoint.x, path.endPoint.y - path.startPoint.y)];
                drawPath.lineWidth = path.lineWidth;
                [path.lineColor set];
                [drawPath setLineJoinStyle:kCGLineJoinRound];
                [drawPath setLineCapStyle:kCGLineCapRound];
                [drawPath stroke];
            }break;
            case DrawStyleArrow: {
                [path.lineColor set];
                [path setLineJoinStyle:kCGLineJoinMiter];
                [path setLineCapStyle:kCGLineCapSquare];
                [path fill];
            }break;
        }
    }
}


@end
