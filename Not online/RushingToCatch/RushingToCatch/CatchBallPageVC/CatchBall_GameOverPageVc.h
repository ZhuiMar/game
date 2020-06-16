//
//  CatchBall_GameOverPageVc.h
//  RushingToCatch
//
//  Created by zy on 2020/6/1.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^CatchBall_GameOverPageVcBlock) ();

@interface CatchBall_GameOverPageVc : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *middLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;

@property (weak, nonatomic) IBOutlet UIButton *againButtion;
@property (weak, nonatomic) IBOutlet UIButton *homeBtn;

- (instancetype)initWithScore:(NSInteger)score level:(NSInteger)level home:(CatchBall_GameOverPageVcBlock)home again:(CatchBall_GameOverPageVcBlock)again;
- (instancetype)initWithCount:(NSInteger)count level:(NSInteger)level levelNumber:(NSInteger)levelNumber home:(CatchBall_GameOverPageVcBlock)home again:(CatchBall_GameOverPageVcBlock)again next:(CatchBall_GameOverPageVcBlock)next;

@end

NS_ASSUME_NONNULL_END
