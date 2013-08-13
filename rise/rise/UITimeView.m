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
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 0.0f, frame.size.width - 20.0f, frame.size.height)];
        [_timeLabel setBackgroundColor:[UIColor clearColor]];
        [_timeLabel setFont:[UIFont systemFontOfSize:36.0f]];
        [_timeLabel setTextColor:[UIColor whiteColor]];
        [_timeLabel setText:@"00:00"];
        [self addSubview:_timeLabel];
        _touched = NO;
        
        [self initTime];
    }
    
    return self;
}

- (void)initTime
{

    NSDateFormatter *formatter;
    NSString        *dateString;
    
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    dateString = [formatter stringFromDate:[NSDate date]];
    _date = [formatter dateFromString:dateString];
}

- (void)updateTimeWithIndex:(int)index
{
    int seconds = index * 5 * 60;
    NSDate *selectedTime = [[NSDate alloc] initWithTimeInterval:seconds sinceDate:_date];
    
    NSDateFormatter *formatter;
    NSString        *dateString;
    
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    
    dateString = [formatter stringFromDate:selectedTime];
    [_timeLabel setText:dateString];
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
    
    if (location.x < self.frame.size.width / 2.0f){
        [_timeLabel setTextAlignment:NSTextAlignmentRight];
    }else{
        [_timeLabel setTextAlignment:NSTextAlignmentLeft];
    }
    
    if ([_delegate respondsToSelector:@selector(positionChangedWithAmount:)]){
        [_delegate positionChangedWithAmount:diff];
    }

}

@end
