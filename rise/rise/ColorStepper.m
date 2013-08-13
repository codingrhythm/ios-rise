//
//  ColorStepper.m
//  rise
//
//  Created by Zack Zhu on 8/13/13.
//  Copyright (c) 2013 zhuyuzhou. All rights reserved.
//

#import "ColorStepper.h"

@implementation ColorStepper

-(id)initWithBaseColor:(UIColor *)baseColor
{
    self = [super init];
    
    if (self != nil){
        _baseColor = baseColor;
        _colors = [[NSMutableArray alloc] init];
        [_colors addObject:_baseColor];
    }
    
    return self;
}

- (void)addColor:(UIColor *)toColor withSteps:(int)steps
{
    UIColor *fromColor = [_colors lastObject];
    CGFloat fromRed;
    CGFloat fromGreen;
    CGFloat fromBlue;
    CGFloat fromAlpha;
    
    [fromColor getRed:&fromRed green:&fromGreen blue:&fromBlue alpha:&fromAlpha];
    
    CGFloat toRed;
    CGFloat toGreen;
    CGFloat toBlue;
    CGFloat toAlpha;
    
    [toColor getRed:&toRed green:&toGreen blue:&toBlue alpha:&toAlpha];
    
    CGFloat redStepSize = (toRed - fromRed) / steps;
    CGFloat greenStepSize = (toGreen - fromGreen) / steps;
    CGFloat blueStepSize = (toBlue - fromBlue) / steps;
    CGFloat alphaStepSize = (toAlpha - fromAlpha) / steps;
    
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat alpha;
    UIColor *color;
    
    for (int i = 0; i < steps; i++){
        red = fromRed + i * redStepSize;
        green = fromGreen + i * greenStepSize;
        blue = fromBlue + i * blueStepSize;
        alpha = fromAlpha + i * alphaStepSize;
        color = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
        [_colors addObject:color];
    }
}

@end
