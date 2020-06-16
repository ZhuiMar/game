//
//  FFTBall_PlanPageVC.h
//  FootballFormationTactics
//
//  Created by zy on 2020/5/27.
//  Copyright © 2020 jingshitong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FFTBall_PlanModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FFTBall_PlanPageVC : UIViewController

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *date;
@property(nonatomic,copy)NSString *place;
@property(nonatomic,strong)FFTBall_PlanModel *model;
@end

NS_ASSUME_NONNULL_END
