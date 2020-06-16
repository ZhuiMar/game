//
//  MatheSpider_getScoreTool.m
//  MathematicalSpider
//
//  Created by zy on 2020/5/22.
//  Copyright © 2020 teresa. All rights reserved.
//

#import "MatheSpider_getScoreTool.h"

@interface MatheSpider_getScoreTool()

@property(nonatomic,copy)NSString *typeString;
@property(nonatomic,assign)NSInteger scoreNumber;
@property(nonatomic,copy)MatheSpider_getScoreToolBlock block;

@end

@implementation MatheSpider_getScoreTool

- (instancetype)initWithType:(NSString *)type score:(NSInteger)score block:(MatheSpider_getScoreToolBlock)block{
    if(self = [super init]){
        self.typeString = type;
        self.scoreNumber = score;
        self.block = block;
    }
    return self;
}
- (void)saveScore{
    if(self.block){
        self.block(@"level 0");
    }
}

@end
