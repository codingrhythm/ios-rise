//
//  ColorStepper.h
//  rise
//
//  Created by Zack Zhu on 8/13/13.
//  Copyright (c) 2013 zhuyuzhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ColorStepper : NSObject


@property (strong, nonatomic) UIColor *baseColor;
@property (strong, nonatomic) NSMutableArray *colors;


-(id)initWithBaseColor:(UIColor *)baseColor;
- (void)addColor:(UIColor *)toColor withSteps:(int)steps;

@end
