//
//  UIImage+GetPixelRGBA.h
//  IrregularButton
//
//  Created by Siri on 2019/4/10.
//  Copyright © 2019年 Siri. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (GetPixelRGBA)
-(UIColor *)colorAtPoint:(CGPoint)point WithImageSize:(CGSize)size;
-(UIImage *)obtainSizeImage:(UIImage *)image toSize:(CGSize)reSize;
@end

NS_ASSUME_NONNULL_END
