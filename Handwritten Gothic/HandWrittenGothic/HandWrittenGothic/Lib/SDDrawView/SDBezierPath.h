//
//  SDBezierPath.h
//  SocketClinetDemo
//
//  Created by bnqc on 2018/6/11.
//  Copyright © 2018 zhuimar. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
    DrawStyleLine,
    DrawStyleSquare,
    DrawStyleCircle,
    DrawStyleArrow
} DrawStyle;

@interface SDBezierPath : UIBezierPath

@property(nonatomic,strong) UIColor *lineColor;
@property(nonatomic,assign) DrawStyle drawStyle;

@property(nonatomic,assign) CGPoint startPoint;
@property(nonatomic,assign) CGPoint endPoint;

@end
