//
//  SecretOfRain_RecodCell.m
//  SecretOfRain
//
//  Created by zy on 2020/4/27.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import "SecretOfRain_RecodCell.h"

@interface SecretOfRain_RecodCell()

@property (weak, nonatomic) IBOutlet UILabel *one;
@property (weak, nonatomic) IBOutlet UILabel *two;
@property (weak, nonatomic) IBOutlet UILabel *three;

@property (weak, nonatomic) IBOutlet UIImageView *bgView;

@end

@implementation SecretOfRain_RecodCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setModel:(NSArray *)arr{
    
    if(arr.count >= 3){
        
        self.one.text = [NSString stringWithFormat:@"%ld",[arr[0] integerValue]];
        self.two.text = [NSString stringWithFormat:@"%ld",[arr[1] integerValue]];
        self.three.text = [NSString stringWithFormat:@"%ld",[arr[2] integerValue]];
        
    }else if (arr.count == 2){
        
        self.one.text = [NSString stringWithFormat:@"%@",arr[0]];
        self.two.text = [NSString stringWithFormat:@"%@",arr[1]];
        self.three.text = @"0";
        
    }else if (arr.count == 1){
        
        self.one.text = [NSString stringWithFormat:@"%@",arr[0]];
        self.two.text = @"0";
        self.three.text = @"0";
        
    }else{
        
        self.one.text = @"0";
        self.two.text = @"0";
        self.three.text = @"0";
    }
}

@end
