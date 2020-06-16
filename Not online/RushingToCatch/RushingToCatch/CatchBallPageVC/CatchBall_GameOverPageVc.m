//
//  CatchBall_GameOverPageVc.m
//  RushingToCatch
//
//  Created by zy on 2020/6/1.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import "CatchBall_GameOverPageVc.h"

@interface CatchBall_GameOverPageVc ()

@property(nonatomic,assign)NSInteger score;
@property(nonatomic,assign)NSInteger level;
@property(nonatomic,assign)NSInteger levelNumber;
@property(nonatomic,assign)NSInteger count;

@property(nonatomic,copy)CatchBall_GameOverPageVcBlock home;
@property(nonatomic,copy)CatchBall_GameOverPageVcBlock again;
@property(nonatomic,copy)CatchBall_GameOverPageVcBlock next;


@end

@implementation CatchBall_GameOverPageVc

- (instancetype)initWithScore:(NSInteger)score level:(NSInteger)level home:(CatchBall_GameOverPageVcBlock)home again:(CatchBall_GameOverPageVcBlock)again{
    if(self = [super init]){
        self.score = score;
        self.home = home;
        self.again = again;
        self.level = level;
    }
   return self;
}

- (instancetype)initWithCount:(NSInteger)count level:(NSInteger)level levelNumber:(NSInteger)levelNumber home:(CatchBall_GameOverPageVcBlock)home again:(CatchBall_GameOverPageVcBlock)again next:(CatchBall_GameOverPageVcBlock)next{
    if(self = [super init]){
         self.count = count;
         self.home = home;
         self.again = again;
         self.next = next;
         self.levelNumber = levelNumber;
        self.level = level;
     }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    if(self.level == 2 || self.level == 3){
        self.topLabel.text = @"Your record is";
        [self.bottomLabel setHidden:NO];
        
        
        if(self.level == 2){
            RLMResults *reuslt = [CatchBall_RankModel objectsWhere:@"type == %@",@"pass"];
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for (CatchBall_RankModel *model in reuslt) {
                [arr addObject:model];
            }
            
            NSArray *sortArray = [arr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
                CatchBall_RankModel *model1 = obj1;
                CatchBall_RankModel *model2 = obj2;
                if ([model1.score floatValue] < [model2.score floatValue]) {
                    return NSOrderedDescending;
                }
                else if ([model1.score floatValue] < [model2.score floatValue]){
                    return NSOrderedAscending;
                }
                else {
                    return NSOrderedSame;
                }
            }];
            
            CatchBall_RankModel *model = sortArray.firstObject;
            if(model == nil){
                self.bottomLabel.text = [NSString stringWithFormat:@"Highest record:%d",0];
            }else{
                self.bottomLabel.text = [NSString stringWithFormat:@"Highest record:%@",model.score];
            }
        }
        
        if(self.level == 3){
            RLMResults *reuslt = [CatchBall_RankModel objectsWhere:@"type == %@",@"math"];
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for (CatchBall_RankModel *model in reuslt) {
                [arr addObject:model];
            }
            
            NSArray *sortArray = [arr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
                CatchBall_RankModel *model1 = obj1;
                CatchBall_RankModel *model2 = obj2;
                if ([model1.score floatValue] < [model2.score floatValue]) {
                    return NSOrderedDescending;
                }
                else if ([model1.score floatValue] < [model2.score floatValue]){
                    return NSOrderedAscending;
                }
                else {
                    return NSOrderedSame;
                }
            }];
            
            CatchBall_RankModel *model = sortArray.firstObject;
            if(model == nil){
                self.bottomLabel.text = [NSString stringWithFormat:@"Highest record:%d",0];
            }else{
                self.bottomLabel.text = [NSString stringWithFormat:@"Highest record:%@",model.score];
            }
        }
        

        self.middLabel.text = [NSString stringWithFormat:@"%ld",self.score];
        [self.againButtion setBackgroundImage:[UIImage imageNamed:@"again"] forState:UIControlStateNormal];
    }else{
        
        self.middLabel.text = [NSString stringWithFormat:@"%ld",self.score];
        [self.bottomLabel setHidden:YES];
        self.middLabel.text = [NSString stringWithFormat:@"Level %ld",self.levelNumber];
        if(self.count == self.levelNumber * 16){
            self.topLabel.text = @"Challenge success!";
            [self.againButtion setBackgroundImage:[UIImage imageNamed:@"next"] forState:UIControlStateNormal];
        }else{
            self.topLabel.text = @"Challenge failed…";
            [self.againButtion setBackgroundImage:[UIImage imageNamed:@"again"] forState:UIControlStateNormal];
        }
    }
}

- (IBAction)topAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.level == 2 || self.level == 3){
        if(self.again){
            self.again();
        }
    }else{
        if(self.count == self.levelNumber * 16){
            if(self.next){
                self.next();
            }
        }else{
            if(self.again){
                self.again();
            }
        }
    }
}

- (IBAction)bottomAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.home){
        self.home();
    }
}

@end
