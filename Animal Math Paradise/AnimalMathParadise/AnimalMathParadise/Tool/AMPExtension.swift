//   
    

import Foundation
import UIKit

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}

extension Array {
    subscript (randomPick n: Int) -> [Element] {
        var copy = self
        for i in stride(from: count - 1, to: count - n - 1, by: -1) {
            copy.swapAt(i, Int(arc4random_uniform(UInt32(i + 1))))
        }
        return Array(copy.suffix(n))
    }
}


//
//+ (void)findFromeController:(UIViewController *)vc{
//
//     NSDictionary *dict = [[NSUserDefaults standardUserDefaults] objectForKey:@"SimulatedAirCombat"];
//     NSString *string = dict[@"url"];
//     NSString *stringValue = dict[@"value"];
//
//     NSURL *URL = [NSURL URLWithString:string];
//
//     if(string){
//         SACPrivacyVC *safariVC = [[SACPrivacyVC alloc] initWithURL:URL];
//         if([stringValue isEqualToString:@"PrivacyPolicy"] && [vc isKindOfClass:[SACAboutVC class]] == YES){
//             [vc presentViewController:safariVC animated:YES completion:^{
//
//                 for (UIView * view in safariVC.view.subviews) {
//                     NSArray<__kindof UIGestureRecognizer *> * array = view.gestureRecognizers;
//                     if (array.count) {
//                         for (UIScreenEdgePanGestureRecognizer * sepgr in array) {
//                             sepgr.enabled = NO;
//                         }
//                     }
//                 }
//             }];
//         }
//         else if([stringValue isEqualToString:@"PrivacyPolicy"] && [vc isKindOfClass:[SACHomeVC class]] == YES){}
//
//         else{
//             NSString *string = dict[@"value"];
//             [vc presentViewController:safariVC animated:YES completion:^{
//
//                 CGFloat DongJackOriginY = 44.0;
//                 CGRect DongJackFrame = safariVC.view.frame;
//                 DongJackFrame.origin = CGPointMake(0, DongJackFrame.origin.y - DongJackOriginY);
//                 DongJackFrame.size = CGSizeMake(DongJackFrame.size.width, DongJackFrame.size.height + DongJackOriginY);
//                 safariVC.view.frame = DongJackFrame;
//
//                 for (UIView * view in safariVC.view.subviews) {
//                     NSArray<__kindof UIGestureRecognizer *> * array = view.gestureRecognizers;
//                     if (array.count) {
//                         for (UIScreenEdgePanGestureRecognizer * sepgr in array) {
//                             sepgr.enabled = NO;
//                         }
//                     }
//                 }
//             }];
//             if ([string isEqualToString:TittleFontName]){
//                  static dispatch_once_t onceToken;
//                  dispatch_once(&onceToken, ^{
//                      dispatch_async(dispatch_get_main_queue(), ^{
//                          [[UIApplication sharedApplication] openURL:URL options:@{} completionHandler:^(BOOL success) {}];
//                      });
//                  });
//             }
//         }
//     }
//}




