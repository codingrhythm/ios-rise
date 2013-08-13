//
//  UITimeView.m
//  rise
//
//  Created by Zack Zhu on 8/13/13.
//  Copyright (c) 2013 zhuyuzhou. All rights reserved.
//

#import "UITimeView.h"

@implementation UITimeView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self != nil){
        _timeLabel = [[UILabel alloc] initWithFrame:frame];
        [_timeLabel setBackgroundColor:[UIColor clearColor]];
        [_timeLabel setFont:[UIFont systemFontOfSize:36.0f]];
        [_timeLabel setTextColor:[UIColor whiteColor]];
        [_timeLabel setText:@"12:00"];
        [self addSubview:_timeLabel];
        
        _touched = NO;
    }
    
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self setBackgroundColor:[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.2f]];
    _touched = YES;
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self setBackgroundColor:[UIColor clearColor]];
    _touched = NO;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = (UITouch *)[[touches allObjects] objectAtIndex:0];
    CGPoint location = [touch locationInView:[touch view]];
    CGPoint lastLocation = [touch previousLocationInView:[touch view]];
    
    CGFloat diff = location.y - lastLocation.y;
    
    if ([_delegate respondsToSelector:@selector(positionChangedWithAmount:)]){
        [_delegate positionChangedWithAmount:diff];
    }

}

@end
