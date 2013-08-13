//
//  RadiusStepper.h
//  rise
//
//  Created by Zack Zhu on 8/13/13.
//  Copyright (c) 2013 zhuyuzhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RadiusStepper : NSObject

@property (strong, nonatomic) NSNumber *baseRadius;
@property (strong, nonatomic) NSMutableArray *radiuses;

-(id)initWithBaseRadius:(CGFloat) baseRadius;

-(void)addRadius:(CGFloat) toRadius withStep:(int) step;

@end
