//
//  ThemeTableViewController.m
//  Cheap Recipes
//
//  Created by Mike Choi on 9/22/14.
//  Copyright (c) 2014 LifePlus Inc. All rights reserved.
//

#import "ThemeTableViewController.h"

@interface ThemeTableViewController ()

@end

@implementation ThemeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //UISwitch
    [self.font_switch addTarget:self action:@selector(setFontState:) forControlEvents:UIControlEventValueChanged];
    [self.woodTable_switch addTarget:self action:@selector(setTableState:) forControlEvents:UIControlEventValueChanged];
}

#pragma Switches

- (void)setFontState:(id)sender
{
    BOOL fontState = [sender isOn];
    if (self.font_switch.on == TRUE){
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setBool:fontState forKey:@"fontState"];
        [self.font_switch setOn:YES];
        [defaults synchronize];
        
            if (! [defaults boolForKey:@"alertShown"]) {
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Notice"
                                                              message:@"You must restart the app in order to see the changes"
                                                             delegate:self
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:@"Cancel",nil];
            [message show];
            [defaults setBool:YES forKey:@"alertShown"];
        }
        
        if ([defaults boolForKey:@"tableState"]==FALSE){
            [defaults boolForKey:@"fontalertShown"];
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Notice"
                                                              message:@"You may not be able to see the menu contents."
                                                             delegate:self
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:@"Cancel",nil];
            [message show];
            [defaults setBool:YES forKey:@"fontalertShown"];
        }

    }
    else if(self.font_switch.on == FALSE){
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setBool:fontState forKey:@"fontState"];
        [self.font_switch setOn:NO];
        [defaults synchronize];
    }
}
- (void)setTableState:(id)sender
{
    BOOL tableState = [sender isOn];
    if (self.woodTable_switch.on == TRUE){
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setBool:tableState forKey:@"tableState"];
        [defaults synchronize];
        [self.woodTable_switch setOn:YES];
        
        if (! [defaults boolForKey:@"alertShown"]) {
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Notice"
                                                              message:@"You must restart the app in order to see the changes"
                                                             delegate:self
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:@"Cancel",nil];
            [message show];
            [defaults setBool:YES forKey:@"alertShown"];
        }
    }
    else if(self.woodTable_switch.on == FALSE){
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setBool:tableState forKey:@"tableState"];
        [defaults synchronize];
        [self.woodTable_switch setOn:NO];
    }
}

@end
