//
//  MPHomeFooter.m
//  MyPlan
//
//  Created by  luzhaoyang on 2020/3/30.
//  Copyright © 2020 yunxi. All rights reserved.
//

#import "MPHomeFooter.h"

@interface MPHomeFooter()

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (nonatomic, assign) NSInteger type;

@end

@implementation MPHomeFooter

+ (instancetype)getHeaderViewType:(NSInteger)type{
    MPHomeFooter *view = [[NSBundle mainBundle] loadNibNamed:@"MPHomeFooter" owner:self options:nil].firstObject;
    view.type = type;
    [view setUiWithView:view];
    return view;
}

- (void)setUiWithView:(MPHomeFooter *)view{
    self.title.font = [UIFont fontWithName:FontName size:25];
    self.title.text = @"No schedule added";
}

@end
