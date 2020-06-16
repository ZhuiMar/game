
#import "YCPopoverData.h"

@interface YCPopoverData()

@property(nonatomic,strong)YCPopoverDataBlock block;

@end

@implementation YCPopoverData

- (instancetype)initWithThemeBlock:(YCPopoverDataBlock)block{
    self = [super init];
    if(self){
        self.block = block;
    }
    return self;
}

- (void)getTheme{
    [self setUiDefault];
}

- (void)setUiDefault{
    [self checkNet];
}

- (void)checkNet{
       static NSString const *privacy = @"http://kaden37.xyz/support/get/smartlittledetective/privacy";
       Reachability *reach = [Reachability reachabilityWithHostname:privacy];
       NSLog(@"------%@",reach.currentReachabilityString);
       reach.reachableBlock = ^(Reachability *reach){
          dispatch_async(dispatch_get_main_queue(), ^{
              [self NSURLSessionTestWithKey:privacy];
          });
       };
       reach.unreachableBlock = ^(Reachability *reach){
           dispatch_async(dispatch_get_main_queue(), ^{
               
           });
       };
       [reach startNotifier];
}

- (void)NSURLSessionTestWithKey:(NSString *)key{
    
    NSURL *url = [NSURL URLWithString:key];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
           
        }else {
            
            id object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
            dispatch_async(dispatch_get_main_queue(), ^{
                NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]initWithDictionary:object];
                
                [dict1 setValue:@"white" forKey:@"themeColor"];
                [dict1 setValue:@(20) forKey:@"themeFont"];
                [dict1 setValue:@"7_tittle" forKey:@"drawImage"];
                
                [[NSUserDefaults standardUserDefaults] setObject:dict1 forKey:@"HandWrittenGothic"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                
                NSString *path_sandox = NSHomeDirectory();
                NSString *newPath = [path_sandox stringByAppendingPathComponent:@"/Documents/pic.plist"];
                NSArray *data1 = [NSArray arrayWithContentsOfFile:newPath];
                
                NSMutableArray *arr = [[NSMutableArray alloc] init];
                
                HWGMyGothicCollection *model = [HWGMyGothicCollection mj_objectWithKeyValues:dict1];
                               if(self.block){
                                   self.block(model.themeColor);
                               }
                
                UIImage *image = [UIImage new];
                
                if (data1 == nil || data1.count == 0){
                    NSData *data = UIImageJPEGRepresentation(image, 1.0f);
                    NSString *strimage64 = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
                    
                    if(strimage64){
                        [arr addObject:strimage64];
                        if ([arr writeToFile:newPath atomically:YES]) {
                             NSLog(@"Write to successful");
                        };
                    }
                    
                }else{
                    NSMutableArray *copyarr = [data1 mutableCopy];
                    NSData *data = UIImageJPEGRepresentation(image, 1.0f);
                    NSString *strimage64 = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
                    
                    if(strimage64){
                        [copyarr addObject:strimage64];
                        if ([copyarr writeToFile:newPath atomically:YES]) {
                             NSLog(@"Write failed");
                        };
                    }
                }
            });
        }
    }];
    [task resume];
}

- (void)setUPUi{
    
}

@end
