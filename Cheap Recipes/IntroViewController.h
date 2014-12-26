//
//  IntroViewController.h
//  Cheap Recipes
//
//  Created by Mike Choi on 7/29/14.
//  Copyright (c) 2014 LifePlus Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASValueTrackingSlider.h"
#import "AKPickerView.h"
#import <TOMSMorphingLabel/TOMSMorphingLabel.h>

@interface IntroViewController : UIViewController

@property (strong, nonatomic) IBOutlet AKPickerView *pickerView;
@property (strong, nonatomic) IBOutlet ASValueTrackingSlider *slider;
@property (weak, nonatomic) IBOutlet TOMSMorphingLabel *adjust_prompt;

- (IBAction)ingredient_button:(id)sender;
- (IBAction)budget_button:(id)sender;

@end
