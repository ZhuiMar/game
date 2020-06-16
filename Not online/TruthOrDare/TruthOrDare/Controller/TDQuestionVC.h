//
//  TDQuestionVC.h
//  TruthOrDare
//
//  Created by  luzhaoyang on 2020/3/10.
//  Copyright © 2020 zhuimar. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TDQuestionVC;
@protocol TDQuestionVCDelegate <NSObject>

- (void)OKAction;
- (void)replaceAction:(TDQuestionVC *)vc;

@end

@interface TDQuestionVC : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property(nonatomic,weak) id<TDQuestionVCDelegate>delagate;
- (instancetype)initWithQuestion:(NSString *)question;

@end

