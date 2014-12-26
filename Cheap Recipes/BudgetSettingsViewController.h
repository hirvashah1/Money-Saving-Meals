//
//  BudgetSettingsViewController.h
//  Cheap Recipes
//
//  Created by Mike Choi on 9/21/14.
//  Copyright (c) 2014 LifePlus Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASValueTrackingSlider.h"
#import <TOMSMorphingLabel/TOMSMorphingLabel.h>

@interface BudgetSettingsViewController : UIViewController
@property (weak, nonatomic) IBOutlet TOMSMorphingLabel *live_label;
@property (weak, nonatomic) IBOutlet ASValueTrackingSlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *previously_set_budget;

- (IBAction)update_button:(id)sender;
@end
