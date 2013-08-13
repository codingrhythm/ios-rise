//
//  UITimeView.h
//  rise
//
//  Created by Zack Zhu on 8/13/13.
//  Copyright (c) 2013 zhuyuzhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TimeViewDelegate <NSObject>

@optional
-(void)positionChangedWithAmount:(CGFloat)changes;

@end
@interface UITimeView : UIView

@property (strong, nonatomic) UILabel *timeLabel;
@property (nonatomic) BOOL touched;

@property (strong, nonatomic) id<TimeViewDelegate> delegate;

@end
