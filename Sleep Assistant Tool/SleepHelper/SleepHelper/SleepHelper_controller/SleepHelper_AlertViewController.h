//
//  SleepHelper_AlertViewController.h
//  SleepHelper
//
//  Created by zy on 2020/5/18.
//  Copyright © 2020 tianma. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SleepHelpeBlock) ();

@interface SleepHelper_AlertViewController : UIViewController

- (instancetype)initWithCancelBlock:(SleepHelpeBlock)cancelBlock OkBlock:(SleepHelpeBlock)block;

@property (weak, nonatomic) IBOutlet UILabel *tittleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *OkBtn;

@end

NS_ASSUME_NONNULL_END
