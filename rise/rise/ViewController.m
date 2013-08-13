//
//  ViewController.m
//  rise
//
//  Created by Zack Zhu on 8/13/13.
//  Copyright (c) 2013 zhuyuzhou. All rights reserved.
//

#import "ViewController.h"
#import "UIGradientBackgroundView.h"
#import "ColorStepper.h"
#import "RadiusStepper.h"

@interface ViewController (){
    UIGradientBackgroundView *bgView;
    NSMutableArray *colors1;
    int colorIdx;
    ColorStepper *colorStepper;
    ColorStepper *colorStepper2;
    ColorStepper *colorStepper3;
    RadiusStepper *radiusStepper;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    colors1 = [[NSMutableArray alloc] init];
	// Do any additional setup after loading the view, typically from a nib.
    bgView = [[UIGradientBackgroundView alloc] initWithFrame:self.view.frame];
    
    self.view = bgView;
    
    colorStepper = [[ColorStepper alloc] initWithBaseColor:[UIColor colorWithHexString:@"#0f3c5b"]];
    [colorStepper addColor:[UIColor colorWithHexString:@"#1f405f"] withSteps:36];
    [colorStepper addColor:[UIColor colorWithHexString:@"#ee595f"] withSteps:24];
    [colorStepper addColor:[UIColor colorWithHexString:@"#5680a6"] withSteps:24];
    [colorStepper addColor:[UIColor colorWithHexString:@"#b5e4f4"] withSteps:36];
    [colorStepper addColor:[UIColor colorWithHexString:@"#e9f8cf"] withSteps:24];
    [colorStepper addColor:[UIColor colorWithHexString:@"#f5f7b8"] withSteps:72];
    [colorStepper addColor:[UIColor colorWithHexString:@"#fde67e"] withSteps:12];
    [colorStepper addColor:[UIColor colorWithHexString:@"#949d7e"] withSteps:15];
    [colorStepper addColor:[UIColor colorWithHexString:@"#01588e"] withSteps:9];
    [colorStepper addColor:[UIColor colorWithHexString:@"#0e3b58"] withSteps:35];
    
    colorStepper2 = [[ColorStepper alloc] initWithBaseColor:[UIColor colorWithHexString:@"#092638"]];
    [colorStepper2 addColor:[UIColor colorWithHexString:@"#163758"] withSteps:36];
    [colorStepper2 addColor:[UIColor colorWithHexString:@"#6e3256"] withSteps:24];
    [colorStepper2 addColor:[UIColor colorWithHexString:@"#3a4572"] withSteps:24];
    [colorStepper2 addColor:[UIColor colorWithHexString:@"#4cb8dc"] withSteps:36];
    [colorStepper2 addColor:[UIColor colorWithHexString:@"#8fd9dc"] withSteps:24];
    [colorStepper2 addColor:[UIColor colorWithHexString:@"#b0c9b4"] withSteps:72];
    [colorStepper2 addColor:[UIColor colorWithHexString:@"#f0b363"] withSteps:12];
    [colorStepper2 addColor:[UIColor colorWithHexString:@"#7f675d"] withSteps:15];
    [colorStepper2 addColor:[UIColor colorWithHexString:@"#003561"] withSteps:9];
    [colorStepper2 addColor:[UIColor colorWithHexString:@"#09283c"] withSteps:35];
    
    colorStepper3 = [[ColorStepper alloc] initWithBaseColor:[UIColor colorWithHexString:@"#061927"]];
    [colorStepper3 addColor:[UIColor colorWithHexString:@"#0b2136"] withSteps:36];
    [colorStepper3 addColor:[UIColor colorWithHexString:@"#2b1e53"] withSteps:24];
    [colorStepper3 addColor:[UIColor colorWithHexString:@"#2b1e53"] withSteps:24];
    [colorStepper3 addColor:[UIColor colorWithHexString:@"#0099cb"] withSteps:36];
    [colorStepper3 addColor:[UIColor colorWithHexString:@"#50c2e4"] withSteps:24];
    [colorStepper3 addColor:[UIColor colorWithHexString:@"#7faeb4"] withSteps:72];
    [colorStepper3 addColor:[UIColor colorWithHexString:@"#be764e"] withSteps:12];
    [colorStepper3 addColor:[UIColor colorWithHexString:@"#002d57"] withSteps:15];
    [colorStepper3 addColor:[UIColor colorWithHexString:@"#002248"] withSteps:9];
    [colorStepper3 addColor:[UIColor colorWithHexString:@"#061927"] withSteps:35];
    
    radiusStepper = [[RadiusStepper alloc] initWithBaseRadius:0.6];
    [radiusStepper addRadius:0.7 withStep:36];
    [radiusStepper addRadius:0.6 withStep:24];
    [radiusStepper addRadius:0.5 withStep:24];
    [radiusStepper addRadius:0.2 withStep:36];
    [radiusStepper addRadius:0.2 withStep:24];
    [radiusStepper addRadius:0.6 withStep:72];
    [radiusStepper addRadius:0.5 withStep:12];
    [radiusStepper addRadius:0.5 withStep:15];
    [radiusStepper addRadius:0.6 withStep:9];
    [radiusStepper addRadius:0.5 withStep:35];
    
    colorIdx = 0;
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = (UITouch *)[[touches allObjects] objectAtIndex:0];
    CGPoint location = [touch locationInView:[touch view]];
    CGFloat y = location.y >=0 ? location.y : 0;
    CGFloat percent = y / self.view.frame.size.height;
    colorIdx = (int)(colorStepper.colors.count * percent);
    [bgView setGradientWithColor1:[[colorStepper colors] objectAtIndex:colorIdx]
                           color2:[[colorStepper2 colors] objectAtIndex:colorIdx]
                           color3:[[colorStepper3 colors] objectAtIndex:colorIdx]
                        andRadius:[[[radiusStepper radiuses] objectAtIndex:colorIdx] floatValue]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
