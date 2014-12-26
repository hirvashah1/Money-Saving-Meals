//
//  AboutViewController.h
//  Cheap Recipes
//
//  Created by Mike Choi on 8/3/14.
//  Copyright (c) 2014 LifePlus Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TOMSMorphingLabel/TOMSMorphingLabel.h>

@interface AboutViewController : UIViewController
- (IBAction)feed_back:(id)sender;
- (IBAction)facebook_button:(id)sender;
- (IBAction)twitter_button:(id)sender;
- (IBAction)text_button:(id)sender;
- (IBAction)appstore_button:(id)sender;
- (IBAction)mail_button:(id)sender;
@property (weak, nonatomic) IBOutlet TOMSMorphingLabel *share_with_friends;

@end
