
#import "DrawLineVC.h"
#import "LianXianDrawView.h"
#import "LianXianBtn.h"

#define KScreenWidth  [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height
#define TheStatusBarHeight  ([[UIApplication sharedApplication] statusBarFrame].size.height)
#define TheNavBarHeight 44
#define StatusBar_NavBar_Height ((TheStatusBarHeight) + (TheNavBarHeight))

@interface DrawLineVC ()<UIGestureRecognizerDelegate>

@property(nonatomic,strong)UIScrollView *bgSC;

@property(nonatomic,strong)NSMutableArray *imageName;
@property(nonatomic,strong)NSMutableArray *titleName;

@property(nonatomic,strong)UIImageView *imageOne;
@property(nonatomic,strong)UIImageView *imageTwo;
@property(nonatomic,strong)UIImageView *imageThree;

@property(nonatomic,strong)UIImageView *rightOne;
@property(nonatomic,strong)UIImageView *rightTwo;
@property(nonatomic,strong)UIImageView *rightThree;

@property(nonatomic,strong)UILabel *labelOne;
@property(nonatomic,strong)UILabel *labelTwo;
@property(nonatomic,strong)UILabel *labelThree;

@property(nonatomic,assign)NSInteger keyOne;
@property(nonatomic,assign)NSInteger keyTwo;
@property(nonatomic,assign)NSInteger keyThree;

@property(nonatomic,assign)NSInteger vOne;
@property(nonatomic,assign)NSInteger vTwo;
@property(nonatomic,assign)NSInteger vThree;

@property(nonatomic,assign)NSInteger currentStart;
@property(nonatomic,assign)NSInteger currentEnd;

@property(nonatomic,strong)NSArray *arr;

@property(nonatomic,assign)NSInteger oneTime;

@property(nonatomic,strong)LianXianDrawView *draw;
@property(nonatomic,assign) NSInteger score;

@end

@implementation DrawLineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.currentStart = 0;
    self.currentEnd = 0;
    self.oneTime = 0;
    
    if kiPhone5 {
        _bgSC = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    }else{
        _bgSC = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight-StatusBar_NavBar_Height)];
    }
    
    [self.view addSubview:_bgSC];
    [self resetQuestion];
    [self.view addSubview:self.draw];
    [self random];
}

- (void)reset{
    
}

- (void)resetQuestion{
    
    NSMutableArray *btnArr = [NSMutableArray array];
    CGFloat Mag = (KScreenWidth-141*2)/3;
    CGFloat top = 250;
    if kiPhone5 {
        top = 160;
    }
    if(kiPhone6){
        top = 200;
    }
       
       for(int i=0;i<2;i++){
           
           for(int j=0;j<3;j++){
               
               UIImageView *imageView = [[UIImageView alloc]init];
               imageView.frame = CGRectMake(Mag+(141+Mag)*i, top+(119+20)*j, 141, 119);
               imageView.image = [UIImage imageNamed:@"box_4"];
               [_bgSC addSubview:imageView];
               LianXianBtn *btn = [[LianXianBtn alloc]initWithFrame:CGRectMake(Mag+(141+Mag)*i, top+(119+20)*j, 141, 119)];
               [_bgSC addSubview:btn];
               
               // images
               if(i == 0 && j == 0){
                   self.imageOne  = [[UIImageView alloc]init];
                   [imageView addSubview:self.imageOne];
                   [self.imageOne mas_makeConstraints:^(MASConstraintMaker *make) {
                       make.width.mas_equalTo(59);
                       make.height.mas_equalTo(43);
                       make.centerX.mas_equalTo(imageView.mas_centerX);
                       make.centerY.mas_equalTo(imageView.mas_centerY);
                   }];
                   btn.tag = 1;
               }
               if(i == 0 && j == 1){
                   self.imageTwo  = [[UIImageView alloc]init];
                   [imageView addSubview:self.imageTwo];
                   [self.imageTwo mas_makeConstraints:^(MASConstraintMaker *make) {
                      make.width.mas_equalTo(59);
                      make.height.mas_equalTo(43);
                      make.centerX.mas_equalTo(imageView.mas_centerX);
                      make.centerY.mas_equalTo(imageView.mas_centerY);
                   }];
                   btn.tag = 2;
               }
               if(i == 0 && j == 2){
                   self.imageThree   = [[UIImageView alloc]init];
                   [imageView addSubview:self.imageThree];
                   [self.imageThree mas_makeConstraints:^(MASConstraintMaker *make) {
                       make.width.mas_equalTo(59);
                       make.height.mas_equalTo(43);
                       make.centerX.mas_equalTo(imageView.mas_centerX);
                       make.centerY.mas_equalTo(imageView.mas_centerY);
                   }];
                   btn.tag = 3;
               }
           
               // labels
               if(i == 1 && j == 0){
                   self.labelOne = [[UILabel alloc]init];
                   self.labelOne.textColor = [UIColor colorWithHexString:@"#1E8DAB"];
                   self.labelOne.font = [UIFont fontWithName:FontName size:20];
                   self.labelOne.textAlignment = NSTextAlignmentCenter;
                   self.labelOne.text = @"进口国画家";
                   
                   [imageView addSubview:self.labelOne];
                   [self.labelOne mas_makeConstraints:^(MASConstraintMaker *make) {
                       make.left.right.top.bottom.mas_equalTo(0);
                   }];

                   self.rightOne = [[UIImageView alloc]init];
                   [imageView addSubview:self.rightOne];
                   [self.rightOne mas_makeConstraints:^(MASConstraintMaker *make) {
                       make.width.height.mas_equalTo(40);
                       make.right.mas_equalTo(0);
                       make.centerY.mas_equalTo(imageView.mas_centerY);
                   }];
                   btn.tag = 4;
               }
               if(i == 1 && j == 1){
                   self.labelTwo = [[UILabel alloc]init];
                   self.labelTwo.textColor = [UIColor colorWithHexString:@"#1E8DAB"];
                   self.labelTwo.font = [UIFont fontWithName:FontName size:20];
                   self.labelTwo.textAlignment = NSTextAlignmentCenter;
                   
                   [imageView addSubview:self.labelTwo];
                   [self.labelTwo mas_makeConstraints:^(MASConstraintMaker *make) {
                       make.left.right.top.bottom.mas_equalTo(0);
                   }];
                   
                   self.rightTwo = [[UIImageView alloc]init];
                   [imageView addSubview:self.rightTwo];
                   [self.rightTwo mas_makeConstraints:^(MASConstraintMaker *make) {
                       make.width.height.mas_equalTo(40);
                       make.right.mas_equalTo(0);
                       make.centerY.mas_equalTo(imageView.mas_centerY);
                   }];
                   btn.tag = 5;
               }
               
               if(i == 1 && j == 2){
                   self.labelThree = [[UILabel alloc]init];
                   self.labelThree.textColor = [UIColor colorWithHexString:@"#1E8DAB"];
                   self.labelThree.font = [UIFont fontWithName:FontName size:20];
                   self.labelThree.textAlignment = NSTextAlignmentCenter;
                   
                   [imageView addSubview:self.labelThree];
                   [self.labelThree mas_makeConstraints:^(MASConstraintMaker *make) {
                       make.left.right.top.bottom.mas_equalTo(0);
                   }];
                   
                   self.rightThree = [[UIImageView alloc]init];
                   [imageView addSubview:self.rightThree];
                   [self.rightThree mas_makeConstraints:^(MASConstraintMaker *make) {
                       make.width.height.mas_equalTo(40);
                       make.right.mas_equalTo(0);
                       make.centerY.mas_equalTo(imageView.mas_centerY);
                   }];
                   btn.tag = 6;
               }
           
               btn.maxverticalList =  3-1;
               btn.maxhorizontalrow =  5-1;
               btn.verticalList = i;
               btn.horizontalrow = j;
               btn.leftCenterPoint = CGPointMake(btn.center.x - btn.frame.size.width/2, btn.center.y);
               btn.rightCenterPoint = CGPointMake(btn.center.x + btn.frame.size.width/2, btn.center.y);
               [btnArr addObject:btn];
           }
       }
       
       self.draw = [[LianXianDrawView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth   , KScreenHeight)];
       self.draw.startBlock = ^(CGPoint point) {
           for (UIButton *button in btnArr) {
               if (CGRectContainsPoint(button.frame, point)) {
                   self->_currentStart = button.tag;
               }
           }
       };
       self.draw.backBlock = ^(CGPoint point) {
           for (UIButton *button in btnArr) {
               if (CGRectContainsPoint(button.frame, point)) {
                   self->_currentEnd = button.tag - 3;
               }
           }
           
           if(self.currentEnd == 1){
               NSString *str = self.arr[0];
               NSArray *arr = [str componentsSeparatedByString:@"="];
               NSString *str1 = arr[0];
               NSString *str2 = arr[1];
               if(self.currentStart == [str1 integerValue] && self.currentEnd == [str2 integerValue]){
                   self.rightOne.image = [UIImage imageNamed:@"right"];
                   self.score = self.score + 1;
               }else{
                   self.rightOne.image = [UIImage imageNamed:@"wrong"];
               }
               self.currentStart = 0;
               self.currentEnd = 0;
               self.oneTime = self.oneTime + 1;
               [self refresh];
           }
           if(self.currentEnd == 2){
               NSString *str = self.arr[1];
               NSArray *arr = [str componentsSeparatedByString:@"="];
               NSString *str1 = arr[0];
               NSString *str2 = arr[1];
               if(self.currentStart == [str1 integerValue] && self.currentEnd == [str2 integerValue]){
                   self.rightTwo.image = [UIImage imageNamed:@"right"];
                   self.score = self.score + 1;
               }else{
                   self.rightTwo.image = [UIImage imageNamed:@"wrong"];
               }
               self.currentStart = 0;
               self.currentEnd = 0;
               self.oneTime = self.oneTime + 1;
               [self refresh];
           }
           if(self.currentEnd == 3){
              NSString *str = self.arr[2];
              NSArray *arr = [str componentsSeparatedByString:@"="];
              NSString *str1 = arr[0];
              NSString *str2 = arr[1];
              if(self.currentStart == [str1 integerValue] && self.currentEnd == [str2 integerValue]){
                  self.rightThree.image = [UIImage imageNamed:@"right"];
                self.score = self.score + 1;
              }else{
                  self.rightThree.image = [UIImage imageNamed:@"wrong"];
              }
               self.currentStart = 0;
               self.currentEnd = 0;
               self.oneTime = self.oneTime + 1;
               [self refresh];
           }
       };
       
    self.draw.btnArr = [NSMutableArray arrayWithArray:btnArr];
    
}


- (void)refresh{
     [[NSNotificationCenter defaultCenter] postNotificationName:@"textChange" object:[NSString stringWithFormat:@"%ld",self.score]];
}

- (void)random{
    
    // suiji content
    NSInteger one = [self getRandomNumber:0 to:self.imageName.count-1];
    NSInteger two;
    NSInteger three;
    do{
        two = [self getRandomNumber:0 to:self.imageName.count-1];
    }while (two == one);
        
    do{
        three = [self getRandomNumber:0 to:self.imageName.count-1];
    }while (three == two || three == one);
    
    self.imageOne.image = [UIImage imageNamed:self.imageName[one]];
    self.imageTwo.image = [UIImage imageNamed:self.imageName[two]];
    self.imageThree.image = [UIImage imageNamed:self.imageName[three]];
        
    NSInteger oneS = [self getRandomNumber:1 to:3];
    NSInteger twoS;
    NSInteger threeS;
    do{
        twoS = [self getRandomNumber:1 to:3];
    }while (twoS == oneS);
    do{
        threeS = [self getRandomNumber:1 to:3];
    }while (threeS == twoS || threeS == oneS);
    
    
    if(oneS==1 && twoS == 2 && threeS == 3){
        self.labelOne.text = self.titleName[one];
        self.labelTwo.text = self.titleName[two];
        self.labelThree.text = self.titleName[three];
        self.arr = @[@"1=1",@"2=2",@"3=3"];
    }
    if(oneS==1 && twoS == 3 && threeS == 2){
        self.labelOne.text = self.titleName[one];
        self.labelTwo.text = self.titleName[three];
        self.labelThree.text = self.titleName[two];
        self.arr = @[@"1=1",@"3=2",@"2=3"];
    }
    if(oneS==2 && twoS == 1 && threeS == 3){
        self.labelOne.text = self.titleName[two];
        self.labelTwo.text = self.titleName[one];
        self.labelThree.text = self.titleName[three];
        self.arr = @[@"2=1",@"1=2",@"3=3"];
    }
    if(oneS==2 && twoS == 3 && threeS == 1){
       self.labelOne.text = self.titleName[two];
       self.labelTwo.text = self.titleName[three];
       self.labelThree.text = self.titleName[one];
       self.arr = @[@"2=1",@"3=2",@"1=3"];
    }
    if(oneS==3 && twoS == 1 && threeS == 2){
       self.labelOne.text = self.titleName[three];
       self.labelTwo.text = self.titleName[one];
       self.labelThree.text = self.titleName[two];
        
        self.arr = @[@"3=1",@"1=2",@"2=3"];
    }
    if(oneS==3 && twoS == 2 && threeS == 1){
       self.labelOne.text = self.titleName[three];
       self.labelTwo.text = self.titleName[two];
       self.labelThree.text = self.titleName[one];
        self.arr = @[@"3=1",@"2=2",@"1=3"];
    }
}


- (NSInteger)getRandomNumber:(NSInteger)from to:(NSInteger)to{
    return (NSInteger)(from + (arc4random() % (to - from + 1)));
}


- (NSMutableArray *)imageName{
    if(_imageName == nil){
       _imageName = [[NSMutableArray alloc]initWithArray:@[@"apple",
        @"avocado",
        @"banana",
        @"cherry",
        @"grape",
        @"lemon",
        @"orange",
        @"peach",
        @"pear",
        @"pomegranate",
        @"strawberry",
        @"watermelon",@"antelope",
        @"bird",
        @"cheetah",
        @"giraffe",
        @"hedgehog",
        @"hippopotamus",
        @"jackal",
        @"lizard",
        @"rhinoceros",
        @"snake",
        @"tiger",
        @"turkey"]];
    }
    return _imageName;
}

- (NSMutableArray *)titleName{

    if(_titleName == nil){
        _titleName = [[NSMutableArray alloc]initWithArray:@[@"アップル",
        @"アボカド",
        @"バナナ",
        @"チェリー",
        @"グレープ",
        @"レモン",
        @"オレンジ",
        @"ピーチ",
        @"梨",
        @"ザクロ",
        @"いちご",
        @"スイカ",
        @"アンテロープ",
        @"バード",
        @"チーター",
        @"キリン",
        @"ハリネズミ",
        @"カバ類",
        @"ジャッカル",
        @"トカゲ",
        @"サイ",
        @"蛇",
        @"タイガー",
        @"トルコ"]];
    }
    return _titleName;
}

@end
