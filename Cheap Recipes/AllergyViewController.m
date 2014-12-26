//
//  AllergyViewController.m
//  Cheap Recipes
//
//  Created by Mike Choi on 7/29/14.
//  Copyright (c) 2014 LifePlus Inc. All rights reserved.
//

#import "AllergyViewController.h"

@interface AllergyViewController ()<AKPickerViewDelegate>
@property (nonatomic, strong) NSArray *allergy_types;

@end

@implementation AllergyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.pickerView.delegate = self;
	self.pickerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	[self.pickerView reloadData];
    self.allergy_types = @[@"Peanut",
                        @"Milk",
                        @"Egg",
                        @"Wheat",
                        @"Fish",
                        @"Shellfish",
                        @"Tree Nuts",
                           @"Custom"];
	[self.pickerView reloadData];

}

- (NSUInteger)numberOfItemsInPickerView:(AKPickerView *)pickerView
{
	return [self.allergy_types count];
}

- (NSString *)pickerView:(AKPickerView *)pickerView titleForItem:(NSInteger)item
{
	return self.allergy_types[item];
}

- (void)pickerView:(AKPickerView *)pickerView didSelectItem:(NSInteger)item
{
	NSLog(@"%@", self.allergy_types[item]);
}

@end