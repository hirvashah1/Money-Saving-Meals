//
//  BudgetSettingsViewController.m
//  Cheap Recipes
//
//  Created by Mike Choi on 9/21/14.
//  Copyright (c) 2014 LifePlus Inc. All rights reserved.
//

#import "BudgetSettingsViewController.h"

@interface BudgetSettingsViewController () <ASValueTrackingSliderDataSource>
@end

@implementation BudgetSettingsViewController

- (void)viewDidLoad {
    // Get the stored data before the view loads
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    float user_budget = [defaults floatForKey:@"user_budget"];
    NSString* budgetString = [NSString stringWithFormat:@"$%.02f", user_budget];
    self.previously_set_budget.text = budgetString;
    
    
    //SLIDER
    self.slider.dataSource = self;
    self.slider.minimumValue = 0.99;
    self.slider.maximumValue = 10;
    self.slider.popUpViewCornerRadius = 12.0;
    self.slider.popUpViewColor = [UIColor blackColor];
    self.slider.font = [UIFont fontWithName:@"TimesNewRomanPSMT" size:30];
    self.slider.textColor = [UIColor whiteColor];
    
    [super viewDidLoad];
}



- (NSString *)slider:(ASValueTrackingSlider *)slider stringForValue:(float)value;
{
    NSString *s;
    NSString *slider_num = [slider.numberFormatter stringFromNumber:@(value)];
    float s_float = [slider_num floatValue];
    s = [NSString stringWithFormat:@"$%.02f", s_float];
    
    value = roundf(s_float);
    
    return s;
}


- (IBAction)update_button:(id)sender {
    
    float budget_from_slider = [self.slider value];
    
    if (!(budget_from_slider > 1.50)){
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"WARNING"
                                                          message:@"You may not receive any recommendations since you've set the budget too low.\n You can change your budget later in Settings."
                                                         delegate:self
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:@"Cancel",nil];
        [message show];
        
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setFloat:budget_from_slider forKey:@"user_budget"];
    [defaults synchronize];
    NSLog(@"Data Saved");

}
@end
