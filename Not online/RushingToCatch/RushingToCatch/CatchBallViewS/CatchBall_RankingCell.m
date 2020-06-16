//
//  CatchBall_RankingCell.m
//  RushingToCatch
//
//  Created by zy on 2020/6/1.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import "CatchBall_RankingCell.h"

@implementation CatchBall_RankingCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
}

- (void)setModel:(CatchBall_RankModel *)model{
    self.timi.text = model.time;
    self.score.text = model.score;
    
//    if(self.tag == 100){
//        self.number.textColor = [NSObject CatchBallcolorWithHexString:@"#FF460D"];
//        self.timi.textColor = [NSObject CatchBallcolorWithHexString:@"#FF460D"];
//        self.score.textColor = [NSObject CatchBallcolorWithHexString:@"#FF460D"];
//    }
//    if(self.tag == 101){
//        self.number.textColor = [NSObject CatchBallcolorWithHexString:@"#FF460D"];
//        self.timi.textColor = [NSObject CatchBallcolorWithHexString:@"#FF460D"];
//        self.score.textColor = [NSObject CatchBallcolorWithHexString:@"#FF460D"];
//    }
//    if(self.tag == 102){
//        self.number.textColor = [NSObject CatchBallcolorWithHexString:@"#FF460D"];
//        self.timi.textColor = [NSObject CatchBallcolorWithHexString:@"#FF460D"];
//        self.score.textColor = [NSObject CatchBallcolorWithHexString:@"#FF460D"];
//    }
}

@end
