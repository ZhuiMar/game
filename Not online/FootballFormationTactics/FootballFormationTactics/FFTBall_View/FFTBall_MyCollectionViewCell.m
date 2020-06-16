//
//  FFTBall_MyCollectionViewCell.m
//  FootballFormationTactics
//
//  Created by zy on 2020/5/27.
//  Copyright © 2020 jingshitong. All rights reserved.
//

#import "FFTBall_MyCollectionViewCell.h"

@interface FFTBall_MyCollectionViewCell()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *palce;

@end

@implementation FFTBall_MyCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setModel:(FFTBall_PlanModel *)model{
    
    self.data = model;
    self.nameLabel.text = model.name;
    self.dateLabel.text = model.date;
    self.palce.text = model.place;
}

@end
