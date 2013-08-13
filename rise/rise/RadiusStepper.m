//
//  RadiusStepper.m
//  rise
//
//  Created by Zack Zhu on 8/13/13.
//  Copyright (c) 2013 zhuyuzhou. All rights reserved.
//

#import "RadiusStepper.h"

@implementation RadiusStepper

-(id)initWithBaseRadius:(CGFloat) baseRadius
{
    self = [super init];
    
    if (self != nil){
        _baseRadius = [NSNumber numberWithFloat:baseRadius];
        _radiuses = [[NSMutableArray alloc] init];
        [_radiuses addObject:_baseRadius];
    }
    
    return self;
}

- (void)addRadius:(CGFloat)toRadius withStep:(int)step
{
    CGFloat fromRadius = [(NSNumber *)[_radiuses lastObject] floatValue];
    CGFloat radiusStep = (toRadius - fromRadius) / step;
    
    CGFloat radius;
    for (int i = 0; i < step; i++){
        radius = fromRadius + i * radiusStep;
        [_radiuses addObject:[NSNumber numberWithFloat:radius]];
    }
}

@end
