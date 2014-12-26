//
//  MoonViewController.m
//  Cheap Recipes
//
//  Created by Mike Choi on 9/23/14.
//  Copyright (c) 2014 LifePlus Inc. All rights reserved.
//

#import "MoonViewController.h"
#import <pop/POP.h>

@interface MoonViewController ()
@property (nonatomic, strong) HMSegmentedControl *segmentedControl;
@end

@implementation MoonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"Breakfast", @"Lunch", @"Dinner"]];
    self.segmentedControl.frame = CGRectMake(0, 518, 320, 40);
    self.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
    self.segmentedControl.font = [UIFont fontWithName:@"TimesNewRomanPSMT" size:20];
    self.segmentedControl.selectionIndicatorHeight = 5.0f;
    self.segmentedControl.selectionIndicatorColor = [UIColor blackColor];
    self.segmentedControl.backgroundColor = [UIColor clearColor];
    [self.segmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:
     UIControlEventValueChanged];
    [self.view addSubview:self.segmentedControl];
    self.background.image = [UIImage imageNamed:@"back.png"];
    //CLOCK
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    
}

-(void)updateTimer{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"hh:mm:ss a"];
    self.clock.text = [formatter stringFromDate:[NSDate date]];
}

- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    if (segmentedControl.selectedSegmentIndex==0){
        UIImage * breakfast = [UIImage imageNamed:@"back.png"];
        [UIView transitionWithView:self.background
                          duration:1.0f
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                            self.background.image = breakfast;
                        } completion:nil];    }
    else if(segmentedControl.selectedSegmentIndex==1){
        UIImage * lunch = [UIImage imageNamed:@"lunch.png"];
        [UIView transitionWithView:self.background
                          duration:1.0f
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                            self.background.image = lunch;
                        } completion:nil];
    }
    else if(segmentedControl.selectedSegmentIndex==2){
        UIImage * dinner = [UIImage imageNamed:@"dinner.png"];
        [UIView transitionWithView:self.background
                          duration:1.0f
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                            self.background.image = dinner;
                        } completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
