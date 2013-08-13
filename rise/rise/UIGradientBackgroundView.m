//
//  UIGradientBackgroundView.m
//  rise
//
//  Created by Zack Zhu on 8/13/13.
//  Copyright (c) 2013 zhuyuzhou. All rights reserved.
//

#import "UIGradientBackgroundView.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIGradientBackgroundView{
    UIColor *_color1;
    UIColor *_color2;
    UIColor *_color3;
    CGFloat _radius;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self != nil){
        _color1 = [UIColor colorWithHexString:@"#0f3c5b"];
        _color2 = [UIColor colorWithHexString:@"#092638"];
        _color3 = [UIColor colorWithHexString:@"#061927"];
        _radius = 0.4;
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)_color1.CGColor,
                               (id)_color2.CGColor,
                               (id)_color3.CGColor, nil];
    CGFloat gradientLocations[] = {0, 0.4, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace,
                                                        (__bridge CFArrayRef)gradientColors,
                                                        gradientLocations);
    CGPoint center = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    CGFloat radius = MAX(CGRectGetHeight(rect),CGRectGetWidth(rect));
    CGContextDrawRadialGradient(context, gradient,
                                center, 0,
                                center, radius,
                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}



- (void) setGradientWithColor1:(UIColor *)color1 color2:(UIColor *)color2 color3:(UIColor *)color3 andRadius:(CGFloat)radius
{
    _color1 = color1;
    _color2 = color2;
    _color3 = color3;
    _radius = radius;
    [self setNeedsDisplay];
}

@end
