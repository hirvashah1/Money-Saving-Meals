//
//  IntroViewController.m
//  Cheap Recipes
//
//  Created by Mike Choi on 7/29/14.
//  Copyright (c) 2014 LifePlus Inc. All rights reserved.
//

#import "IntroViewController.h"

@interface IntroViewController () <AKPickerViewDelegate, ASValueTrackingSliderDataSource>
@property (nonatomic, strong) NSArray *food_types;
@property (nonatomic, assign) NSInteger idx;
@property (nonatomic, strong) NSArray *textValues;
@property (nonatomic, assign) NSNumber *user_budget;
@property (nonatomic, strong) NSString *user_fav_ingredient;
@end

@implementation IntroViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.pickerView.delegate = self;
	self.pickerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	[self.pickerView reloadData];
    self.food_types = @[@"Chicken",
                        @"Beef",
                        @"Pasta",
                        @"Seafood",
                        @"Rice",
                        @"Fish",
                        @"Lamb",
                        @"Pork",
                        @"Salad",
                        @"Bread"];
	[self.pickerView reloadData];

    self.slider.dataSource = self;
    self.slider.minimumValue = 0.99;
    self.slider.maximumValue = 10;
    self.slider.popUpViewCornerRadius = 12.0;
    self.slider.popUpViewColor = [UIColor blackColor];
    self.slider.font = [UIFont fontWithName:@"TimesNewRomanPSMT" size:30];
    self.slider.textColor = [UIColor whiteColor];
 
    self.idx = 0;
    [self toggleTextForLabel:self.adjust_prompt];
    self.adjust_prompt.textAlignment = NSTextAlignmentCenter;

}

- (NSArray *)textValues
{
    if (!_textValues) {
        _textValues = @[
                        @"Readjust",
                        @"Readjust your",
                        @"BUDGET",
                        @"so",
                        @"so the app can",
                        @"give you",
                        @"Way",
                        @"WAY",
                        @"WAYYY",
                        @"Better",
                        @"RECOMMENDATIONS"
                        ];
    }
    return _textValues;
}

- (void)setIdx:(NSInteger)idx
{
    _idx = MAX(0, MIN(idx, idx % [self.textValues count]));
}

- (void)toggleTextForLabel:(UILabel *)label
{
    self.adjust_prompt.text = self.textValues[self.idx++];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self toggleTextForLabel:self.adjust_prompt];
    });
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

- (NSUInteger)numberOfItemsInPickerView:(AKPickerView *)pickerView
{
	return [self.food_types count];
}

- (NSString *)pickerView:(AKPickerView *)pickerView titleForItem:(NSInteger)item
{
	return self.food_types[item];
}

- (void)pickerView:(AKPickerView *)pickerView didSelectItem:(NSInteger)item
{
	NSLog(@"%@", self.food_types[item]);
    
}



- (IBAction)ingredient_button:(id)sender {

}

- (IBAction)budget_button:(id)sender {
    
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
