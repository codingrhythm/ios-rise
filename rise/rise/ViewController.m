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

@interface ViewController (){
    UIGradientBackgroundView *bgView;
    NSMutableArray *colors1;
    int colorIdx;
    ColorStepper *colorStepper;
    ColorStepper *colorStepper2;
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
    [colorStepper addColor:[UIColor colorWithHexString:@"#eb5862"] withSteps:48];
    [colorStepper addColor:[UIColor colorWithHexString:@"#1ba4d2"] withSteps:48];
    [colorStepper addColor:[UIColor colorWithHexString:@"#bee9f0"] withSteps:48];
    [colorStepper addColor:[UIColor colorWithHexString:@"#fde47d"] withSteps:48];
    [colorStepper addColor:[UIColor colorWithHexString:@"#fec96b"] withSteps:48];
    [colorStepper addColor:[UIColor colorWithHexString:@"#0f3c5b"] withSteps:48];
    
    colorStepper2 = [[ColorStepper alloc] initWithBaseColor:[UIColor colorWithHexString:@"#061927"]];
    [colorStepper2 addColor:[UIColor colorWithHexString:@"#2b1e53"] withSteps:48];
    [colorStepper2 addColor:[UIColor colorWithHexString:@"#243064"] withSteps:48];
    [colorStepper2 addColor:[UIColor colorWithHexString:@"#0ea0d1"] withSteps:48];
    [colorStepper2 addColor:[UIColor colorWithHexString:@"#b1714e"] withSteps:48];
    [colorStepper2 addColor:[UIColor colorWithHexString:@"#05365f"] withSteps:48];
    [colorStepper2 addColor:[UIColor colorWithHexString:@"#061927"] withSteps:48];
    
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
                        andColor2:[[colorStepper2 colors] objectAtIndex:colorIdx]];
}

-(void)changeColor
{
    if (colorIdx == [[colorStepper colors] count]-1){
        return;
    }
    
    [bgView setGradientWithColor1:[[colorStepper colors] objectAtIndex:colorIdx]
                        andColor2:[[colorStepper2 colors] objectAtIndex:colorIdx]];
    colorIdx ++;
    [self performSelector:@selector(changeColor) withObject:self afterDelay:0.1f];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
