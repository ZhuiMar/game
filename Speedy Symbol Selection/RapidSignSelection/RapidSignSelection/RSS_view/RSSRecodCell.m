//
//  RSSRecodCell.m
//  RapidSignSelection
//
//  Created by zy on 2020/6/5.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import "RSSRecodCell.h"

@implementation RSSRecodCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
}

- (void)setModel:(NSArray *)arrary{
    
    
    if(arrary.count >= 3){
        
        self.one.text = [NSString stringWithFormat:@"%ld",[arrary[0] integerValue]];
        self.two.text = [NSString stringWithFormat:@"%ld",[arrary[1] integerValue]];
        self.three.text = [NSString stringWithFormat:@"%ld",[arrary[2] integerValue]];
        
    }else if (arrary.count == 2){
        
        self.one.text = [NSString stringWithFormat:@"%@",arrary[0]];
        self.two.text = [NSString stringWithFormat:@"%@",arrary[1]];
        self.three.text = @"0";
        
    }else if (arrary.count == 1){
        
        self.one.text = [NSString stringWithFormat:@"%@",arrary[0]];
        self.two.text = @"0";
        self.three.text = @"0";
        
    }else{
        
        self.one.text = @"0";
        self.two.text = @"0";
        self.three.text = @"0";
    }
}

@end
