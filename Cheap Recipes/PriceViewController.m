//
//  PriceViewController.m
//  Cheap Recipes
//
//  Created by Mike Choi on 9/20/14.
//  Copyright (c) 2014 LifePlus Inc. All rights reserved.
//

#import "PriceViewController.h"

@interface PriceViewController () <ASValueTrackingSliderDataSource>
@property (nonatomic, strong) NSArray *textValues;
@property (nonatomic, assign) NSInteger idx;


@end

@implementation PriceViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.slider.dataSource = self;
    self.slider.minimumValue = 0.99;
    self.slider.maximumValue = 10;
    self.slider.popUpViewCornerRadius = 12.0;
    self.slider.popUpViewColor = [UIColor blackColor];
    self.slider.font = [UIFont fontWithName:@"TimesNewRomanPSMT" size:30];
    self.slider.textColor = [UIColor whiteColor];
    
    self.idx = 0;
    [self toggleTextForLabel:self.text];
    self.text.textAlignment = NSTextAlignmentCenter;
}
- (NSArray *)textValues
{
    if (!_textValues) {
        _textValues = @[
                        @"How much",
                        @"💰",
                        @"Do you want to",
                        @"spend on",
                        @"🍝 🍲 🍗",
                        @"Today?"
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
    self.text.text = self.textValues[self.idx++];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self toggleTextForLabel:self.text];
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



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end