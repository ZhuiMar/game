//
//  CJHowToVC.m
//  ColorJudgment
//
//  Created by  luzhaoyang on 2020/3/17.
//  Copyright © 2020年 haike. All rights reserved.
//

#import "CJHowToVC.h"

@interface CJHowToVC ()

@property (strong, nonatomic) UIScrollView *scrollView;

@end

@implementation CJHowToVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"how to play";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.scrollView];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"description"]];
    imageView.frame = CGRectMake(15, 0, Iphone_Width-15, 667*3 + 119);
    [self.scrollView addSubview:imageView];
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.contentSize = CGSizeMake(Iphone_Width, 667*3 + 119);
        _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _scrollView;
}

@end
