//
//  WXIrregularButton.m
//  IrregularButton
//
//  Created by Siri on 2019/4/10.
//  Copyright © 2019年 Siri. All rights reserved.
//

#import "WXIrregularButton.h"
#import "UIImage+GetPixelRGBA.h"

@implementation WXIrregularButton


-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    UIImage *image = [self imageForState:UIControlStateNormal];
    if (!image) {
        return YES;
    }
    CGColorRef color = [[image colorAtPoint:point WithImageSize:self.frame.size] CGColor];
    CGFloat alphaValue = CGColorGetAlpha(color);
    return (alphaValue >= 0.1f);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
