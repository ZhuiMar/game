

#import "XTPasterStageView.h"
#import "XTPasterView.h"
#import "UIImage+AddFunction.h"


#define APPFRAME    [UIScreen mainScreen].bounds

@interface XTPasterStageView () <XTPasterViewDelegate>
{
    CGPoint         startPoint ;
    CGPoint         touchPoint ;
    NSMutableArray  *m_listPaster ;
}

@property (nonatomic,strong) UIButton       *bgButton ;
@property (nonatomic,strong) UIImageView    *imgView ;
@property (nonatomic,strong) XTPasterView   *pasterCurrent ;
@property (nonatomic)        int            newPasterID ;

@end

@implementation XTPasterStageView

- (void)setOriginImage:(UIImage *)originImage
{
    _originImage = originImage ;
    
    self.imgView.image = originImage ;
}

- (int)newPasterID
{
    _newPasterID++ ;
    
    return _newPasterID ;
}

- (void)setPasterCurrent:(XTPasterView *)pasterCurrent
{
    _pasterCurrent = pasterCurrent ;
    
    [self bringSubviewToFront:_pasterCurrent] ;
}

- (UIButton *)bgButton
{
    if (!_bgButton) {
        _bgButton = [[UIButton alloc] initWithFrame:self.frame] ;
        _bgButton.tintColor = nil ;
        _bgButton.backgroundColor = nil ;
        [_bgButton addTarget:self
                      action:@selector(backgroundClicked:)
            forControlEvents:UIControlEventTouchUpInside] ;
        if (![_bgButton superview]) {
            [self addSubview:_bgButton] ;
        }
    }
    
    return _bgButton ;
}

- (UIImageView *)imgView
{
    if (!_imgView)
    {
//        CGRect rect = CGRectZero ;
//        rect.size.width = self.frame.size.width ;
//        rect.size.height = self.frame.size.width ;
//        rect.origin.y = ( self.frame.size.height - self.frame.size.width ) / 2.0 ;
        
        CGRect frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        
//        _imgView = [[UIImageView alloc] initWithFrame:rect];
        
        _imgView = [[UIImageView alloc] initWithFrame:frame];
        _imgView.contentMode = UIViewContentModeScaleAspectFit ;
        
        if (![_imgView superview]){
            [self addSubview:_imgView];
        }
    }
    
    return _imgView ;
}

#pragma mark - initial
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self){
        m_listPaster = [[NSMutableArray alloc] initWithCapacity:1] ;
        [self imgView];
        [self bgButton];
    }
    return self;
}

#pragma mark - public
- (void)addPasterWithImg:(UIImage *)imgP
{
    [self clearAllOnFirst] ;
    self.pasterCurrent = [[XTPasterView alloc] initWithBgView:self
                                                     pasterID:self.newPasterID
                                                          img:imgP] ;
    _pasterCurrent.delegate = self ;
    [m_listPaster addObject:_pasterCurrent] ;
}

- (UIImage *)doneEdit
{
//    NSLog(@"done") ;
    [self clearAllOnFirst] ;
    
//    NSLog(@"self.originImage.size : %@",NSStringFromCGSize(self.originImage.size)) ;
    CGFloat org_width = self.originImage.size.width ;
    CGFloat org_heigh = self.originImage.size.height ;
    CGFloat rateOfScreen = org_width / org_heigh ;
    CGFloat inScreenH = self.frame.size.width / rateOfScreen ;
    
    CGRect rect = CGRectZero ;
    rect.size = CGSizeMake(APPFRAME.size.width, inScreenH) ;
    rect.origin = CGPointMake(0, (self.frame.size.height - inScreenH) / 2) ;
    
    UIImage *imgTemp = [UIImage getImageFromView:self] ;
    
//    NSLog(@"imgTemp.size : %@",NSStringFromCGSize(imgTemp.size)) ;
//    UIImage *imgCut = [UIImage squareImageFromImage:imgTemp scaledToSize:rect.size.width] ;
    
    UIImage *imgCut = [self cutAlphaZero:imgTemp];
    return imgCut;
}

- (UIImage *)cutAlphaZero:(UIImage*)image {
    
    CGImageRef cgimage = [image CGImage];
    
    size_t width = CGImageGetWidth(cgimage);
    size_t height = CGImageGetHeight(cgimage);
    
    unsigned char *data = calloc(width * height * 4, sizeof(unsigned char));
    size_t bitsPerComponent = 8;
    size_t bytesPerRow = width * 4;
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    
    CGContextRef context = CGBitmapContextCreate(data, width,height,bitsPerComponent,bytesPerRow,space,kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), cgimage);
    int top = 5;
    int left = 15;
    int right = 15;
    int bottom = 10;
    
    if kiPhone6 {
        top = 15;
        left = 2;
        right = 2;
        bottom = 20;
    }
    
    if kiPhone5 {
        top = 52;
        left = 2;
        right = 2;
        bottom = 57;
    }
    
    for (size_t row = 0; row < height; row++) {
        BOOL find = false;
        for (size_t col = 0; col < width; col++) {
            size_t pixelIndex = (row * width + col) * 4;
            //            int red = data[pixelIndex];
            //            int green = data[pixelIndex+1];
            //            int blue = data[pixelIndex + 2];
            int alpha = data[pixelIndex + 3];
            if (alpha != 0) {
                find = YES;
                break;
            }
        }
        if (find) {
            break;
        }
        top ++;
    }
    
    for (size_t col = 0; col < width; col++) {
        BOOL find = false;
        for (size_t row = 0; row < height; row++) {
            size_t pixelIndex = (row * width + col) * 4;
            
            int alpha = data[pixelIndex + 3];
            if (alpha != 0) {
                find = YES;
                break;
            }
        }
        if (find) {
            break;
        }
        left ++;
    }
    
    for (size_t col = width - 1; col > 0; col--) {
        BOOL find = false;
        for (size_t row = 0; row < height; row++) {
            size_t pixelIndex = (row * width + col) * 4;
            
            int alpha = data[pixelIndex + 3];
            if (alpha != 0) {
                find = YES;
                break;
            }
        }
        if (find) {
            break;
        }
        right ++;
    }
    
    for (size_t row = height - 1; row > 0; row--) {
        BOOL find = false;
        for (size_t col = 0; col < width; col++) {
            size_t pixelIndex = (row * width + col) * 4;
            int alpha = data[pixelIndex + 3];
            if (alpha != 0) {
                find = YES;
                break;
            }
        }
        if (find) {
            break;
        }
        bottom ++;
    }
    

    CGFloat scale = image.scale;
    CGImageRef newImageRef = CGImageCreateWithImageInRect(cgimage, CGRectMake(left * scale, top *scale, (image.size.width - left - right)*scale, (image.size.height - top - bottom)*scale));
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    
    CGImageRelease(cgimage);
    CGContextRelease(context);
    CGColorSpaceRelease(space);
    return  newImage;
}



- (void)backgroundClicked:(UIButton *)btBg
{
    NSLog(@"back clicked") ;
    
    [self clearAllOnFirst] ;
}

- (void)clearAllOnFirst
{
    _pasterCurrent.isOnFirst = NO ;
    
    [m_listPaster enumerateObjectsUsingBlock:^(XTPasterView *pasterV, NSUInteger idx, BOOL * _Nonnull stop) {
         pasterV.isOnFirst = NO ;
    }] ;
}

#pragma mark - PasterViewDelegate
- (void)makePasterBecomeFirstRespond:(int)pasterID ;
{
    [m_listPaster enumerateObjectsUsingBlock:^(XTPasterView *pasterV, NSUInteger idx, BOOL * _Nonnull stop) {
        
        pasterV.isOnFirst = NO ;

        if (pasterV.pasterID == pasterID)
        {
            self.pasterCurrent = pasterV ;
            pasterV.isOnFirst = YES ;
        }
        
    }] ;
}

- (void)removePaster:(int)pasterID
{
    [m_listPaster enumerateObjectsUsingBlock:^(XTPasterView *pasterV, NSUInteger idx, BOOL * _Nonnull stop) {
        if (pasterV.pasterID == pasterID)
        {
            [m_listPaster removeObjectAtIndex:idx] ;
            *stop = YES ;
        }
    }] ;
}

@end

