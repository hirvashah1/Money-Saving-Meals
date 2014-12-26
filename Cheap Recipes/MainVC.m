//
//  MainVC.m
//  Cheap Recipes
//
//  Created by Mike Choi on 7/30/14.
//  Copyright (c) 2014 LifePlus Inc. All rights reserved.
//

#import "MainVC.h"

@interface MainVC ()

@end

@implementation MainVC

- (void)viewDidLoad
{
    [super viewDidLoad];
}


#pragma mark LEFT MENU

- (NSString *) segueIdentifierForIndexPathInLeftMenu:(NSIndexPath *)indexPath{
   
    NSString *identifier;
    switch (indexPath.row) {
        case 0:
            identifier = @"firstSegue";
            break;
        case 1:
            identifier = @"firstSegue";
            break;
        case 2:
            identifier = @"secondSegue";
            break;
        case 3:
            identifier = @"thirdSegue";
            break;
        case 4:
            identifier = @"forthSegue";
            break;
        case 5:
            identifier = @"fifthSegue";
            break;
        case 6:
            identifier = @"sixthSegue";
            break;
            
        default:
            break;
    }
    
    return identifier;
}


- (NSString *) segueIdentifierForIndexPathInRightMenu:(NSIndexPath *)indexPath{
    
    NSString *identifier;
    switch (indexPath.row) {
        case 0:
            identifier = @"firstRightSegue";
            break;
        default:
            break;
            
    }
    
    return identifier;
}

- (void)configureLeftMenuButton:(UIButton *)button{
    CGRect frame  = button.frame;
    frame.origin = (CGPoint) {0,0};
    frame.size = (CGSize){30,30};
    button.frame = frame;
    
    [button setImage:[UIImage imageNamed:@"icon-menu"] forState:UIControlStateNormal];
}

- (void)configureRightMenuButton:(UIButton *)button{
    CGRect frame  = button.frame;
    frame.origin = (CGPoint) {0,0};
    frame.size = (CGSize){30,30};
    button.frame = frame;
    
    [button setImage:[UIImage imageNamed:@"search-icon"] forState:UIControlStateNormal];
    
}

- (CGFloat)leftMenuWidth{
    
    return 220;
}

- (CGFloat)rightMenuWidth{
    return 220;
}

- (BOOL)deepnessForLeftMenu{
    return TRUE;
}

- (BOOL)deepnessForRightMenu{
    return TRUE;
}

@end
