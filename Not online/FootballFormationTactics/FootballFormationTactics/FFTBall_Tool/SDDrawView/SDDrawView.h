//
//  SDDrawView.h
//  SocketClinetDemo
//
//  Created by bnqc on 2018/6/11.
//  Copyright © 2018 zhuimar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDBezierPath.h"

@interface SDDrawView : UIView

@property(nonatomic,strong) UIColor *drawViewColor;
@property(nonatomic,assign) CGFloat lineWidth;
@property(nonatomic,assign) DrawStyle drawStyle;
@property(nonatomic,strong) UIColor *lineColor;

- (void)cleanAction;
- (void)rollbackAction;

@end
