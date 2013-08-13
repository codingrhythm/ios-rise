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
    CGGradientRef _gradient;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self != nil){
        _color1 = [UIColor colorWithHexString:@"#0f3c5b"];
        _color2 = [UIColor colorWithHexString:@"#092638"];
        _color3 = [UIColor colorWithHexString:@"#061927"];
        _gradient = [UIGradientBackgroundView generateGradientWithColor1:_color1 color2:_color2 color3:_color3];
        _radius = 0.6;
    }
    
    return self;
}

+ (CGGradientRef) generateGradientWithColor1:(UIColor *)color1 color2:(UIColor *)color2 color3:(UIColor *)color3
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    NSArray* gradientColors;
    CGFloat gradientLocations[] = {0, 0.6, 1};
    CGGradientRef gradient;
    gradientColors = [NSArray arrayWithObjects:
                      (id)color1.CGColor,
                      (id)color2.CGColor,
                      (id)color3.CGColor, nil];
    
    gradient  = CGGradientCreateWithColors(colorSpace,
                                           (__bridge CFArrayRef)gradientColors,
                                           gradientLocations);
    CGColorSpaceRelease(colorSpace);
    
    return gradient;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGPoint center = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    CGFloat radius = CGRectGetHeight(rect) * _radius;
    CGContextDrawRadialGradient(context, _gradient,
                                center, 0,
                                center, radius,
                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
}



- (void) setGradientWithColor1:(UIColor *)color1 color2:(UIColor *)color2 color3:(UIColor *)color3 andRadius:(CGFloat)radius
{
    _color1 = color1;
    _color2 = color2;
    _color3 = color3;
    _radius = radius;
    [self setNeedsDisplay];
}

- (void) setGradient:(CGGradientRef)gradient withRadius:(CGFloat)radius
{
    _gradient = gradient;
    _radius = radius;
    [self setNeedsDisplay];
}

@end
