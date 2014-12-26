//
//  PriceViewController.h
//  Cheap Recipes
//
//  Created by Mike Choi on 9/20/14.
//  Copyright (c) 2014 LifePlus Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASValueTrackingSlider.h"
#import "AKPickerView.h"
#import <TOMSMorphingLabel/TOMSMorphingLabel.h>

@interface PriceViewController : UIViewController
@property (weak, nonatomic) IBOutlet ASValueTrackingSlider *slider;
@property (weak, nonatomic) IBOutlet TOMSMorphingLabel *text;

@end
