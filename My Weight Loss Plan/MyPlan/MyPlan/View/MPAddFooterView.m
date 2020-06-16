//
//  MPAddFooterView.m
//  MyPlan
//
//  Created by  luzhaoyang on 2020/3/28.
//  Copyright © 2020 yunxi. All rights reserved.
//

#import "MPAddFooterView.h"

@interface MPAddFooterView()

@property(nonatomic,assign) NSInteger type;

@end

@implementation MPAddFooterView

+ (instancetype)getAddFooterViewType:(NSInteger)type{
    MPAddFooterView *view = [[NSBundle mainBundle] loadNibNamed:@"MPAddFooterView" owner:nil options:nil].firstObject;
    view.type = type;
    return view;
}

- (IBAction)addAction:(id)sender {
    if([self.delegate respondsToSelector:@selector(addActionWithType:)]){
        [self.delegate addActionWithType:self.type];
    }
}

@end

