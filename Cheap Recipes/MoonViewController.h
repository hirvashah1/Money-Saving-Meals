//
//  MoonViewController.h
//  Cheap Recipes
//
//  Created by Mike Choi on 9/23/14.
//  Copyright (c) 2014 LifePlus Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "HMSegmentedControl.h"

@interface MoonViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *background;
@property (weak, nonatomic) IBOutlet UILabel *clock;
@property (weak, nonatomic)  NSTimer *timer;
-(void)updateTimer;
@end


