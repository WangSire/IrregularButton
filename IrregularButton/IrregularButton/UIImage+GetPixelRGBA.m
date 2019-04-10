//
//  UIImage+GetPixelRGBA.m
//  IrregularButton
//
//  Created by Siri on 2019/4/10.
//  Copyright © 2019年 Siri. All rights reserved.
//

#import "UIImage+GetPixelRGBA.h"

@implementation UIImage (GetPixelRGBA)
/*
 获取点击像素点位置的颜色,来判断如果有颜色则在相应范围内,如果没有则不响应
 */

//取得点击位置像素颜色
-(UIColor *)colorAtPoint:(CGPoint)point WithImageSize:(CGSize)size{
    UIImage *resizeimage = [self obtainSizeImage:self toSize:size];
    CGRect rect = CGRectMake(0.0f, 0.0f, resizeimage.size.width, resizeimage.size.height);
    if (CGRectContainsPoint(rect, point) == NO)  {return nil;}
    
    CGImageRef image = resizeimage.CGImage;
    size_t width = CGImageGetWidth(image);
    size_t height = CGImageGetHeight(image);
    int bytesPerPixel = 4;
    int bytesPerRow = (bytesPerPixel*1);        // 8bpp
    unsigned char pixelData[4] = {0, 0, 0, 0};
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(pixelData, 1, 1, 8, bytesPerRow, colorSpace, kCGImageAlphaPremultipliedLast|kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    
    if (context == NULL)  {
        NSLog(@"[colorAtPixel] Unable to create context!");
        return nil;
    }
    
    CGContextSetBlendMode(context, kCGBlendModeCopy);
    CGFloat pointX = point.x;
    CGFloat pointY = height-point.y;
    CGContextTranslateCTM(context, -pointX, -pointY);
    CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, (CGFloat)width, (CGFloat)height), image);
    CGContextRelease(context);
    
    //Convert color values [0..255] to floats [0.0..1.0]
    CGFloat red = (CGFloat)pixelData[0]/255.0f;
    CGFloat green = (CGFloat)pixelData[1]/255.0f;
    CGFloat blue = (CGFloat)pixelData[2]/255.0f;
    CGFloat alpha = (CGFloat)pixelData[3]/255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

//更改 UIImage 大小
-(UIImage *)obtainSizeImage:(UIImage *)image toSize:(CGSize)reSize
{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return reSizeImage;
}
@end
