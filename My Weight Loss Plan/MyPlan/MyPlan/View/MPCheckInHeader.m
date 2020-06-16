//
//  MPCheckInHeader.m
//  MyPlan
//
//  Created by  luzhaoyang on 2020/3/29.
//  Copyright © 2020 yunxi. All rights reserved.
//

#import "MPCheckInHeader.h"

@interface MPCheckInHeader()

@end

@implementation MPCheckInHeader

+ (instancetype)getCheckInHeaderViewType:(NSInteger)type{
    MPCheckInHeader *view = [[NSBundle mainBundle] loadNibNamed:@"MPCheckInHeader" owner:nil options:nil].lastObject;
    view.type = type;
    [view setUiWithView:view];
    return view;
}

- (void)setUiWithView:(MPCheckInHeader *)view{
    view.imageName.font = [UIFont fontWithName:FontName size:25];
    if(self.type == 0){
        self.imageView.image = [UIImage imageNamed:@"Breakfast"];
        self.imageName.text = @"Breakfast";
    }else if (self.type == 1){
        self.imageView.image = [UIImage imageNamed:@"Lunch"];
        self.imageName.text = @"Lunch";
    }else{
        self.imageView.image = [UIImage imageNamed:@"Dinner"];
        self.imageName.text = @"Dinner";
    }
}

- (IBAction)checkInAction:(id)sender {
    if([self.delegate respondsToSelector:@selector(checkInActionType:)]){
        [self.delegate checkInActionType:self.type];
    }
}

@end

