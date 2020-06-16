//
//  ECHomeViewController.m
//  EnvironmentCognize
//
//  Created by luzhaoyang on 2020/4/7.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import "ECHomeViewController.h"


@interface ECHomeViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *whitlayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightLayout;

@end

@implementation ECHomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    if kiPhone5 {
        self.whitlayout.constant = 280;
        self.heightLayout.constant = 70;
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(goToPrivacy:) name:@"goToPrivacy" object:nil];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self popGestureChange:self enable:NO];
}

- (void)popGestureChange:(UIViewController *)vc enable:(BOOL)enable{
    if ([vc.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        for (UIGestureRecognizer *popGesture in vc.navigationController.interactivePopGestureRecognizer.view.gestureRecognizers) {
            popGesture.enabled = enable;
        }
    }
}

- (void)goToPrivacy:(NSNotification *)info{
     [self openAbout];
}

- (IBAction)tipAc:(id)sender {
    ECTipsViewController *vc = [[ECTipsViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)learning:(id)sender {
    ECLearnViewController *vc = [[ECLearnViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)findAction:(id)sender {
    ECFindDiffViewController *vc = [[ECFindDiffViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)about:(id)sender {
    ECAboutViewController *vc = [[ECAboutViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)openAbout{
    [NSObject findFromeController:self];
}

@end
