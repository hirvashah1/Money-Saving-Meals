//
//  MainViewController.m
//  Cheap Recipes
//
//  Created by Mike Choi on 7/30/14.
//  Copyright (c) 2014 LifePlus Inc. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation MainViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //self.featureHeight = 200.0f;
    //self.collapsedHeight = 100.0f;
}


#pragma mark - RPSlidingMenuViewController

-(NSInteger)numberOfItemsInSlidingMenu{
    
    return 5;
}

- (void)customizeCell:(RPSlidingMenuCell *)slidingMenuCell forRow:(NSInteger)row{
    
    if (row == 0) {
        slidingMenuCell.textLabel.text = @"Ginger Honey Wings";
        slidingMenuCell.textLabel.font = [UIFont fontWithName:@"TimesNewRomanPS-ItalicMT" size:35];
        
        slidingMenuCell.detailTextLabel.text = @"Finger Lickin' Good";
        slidingMenuCell.detailTextLabel.font = [UIFont fontWithName:@"TimesNewRomanPS" size:20];
        slidingMenuCell.backgroundImageView.image = [UIImage imageNamed:@"ginger_honey_chicken_wings.png"];
    }
    else if( row == 1){
        
        slidingMenuCell.textLabel.text = @"Apple Celeriac Soup";
        slidingMenuCell.textLabel.font = [UIFont fontWithName:@"TimesNewRomanPS-ItalicMT" size:35];
        
        slidingMenuCell.detailTextLabel.text = @"This thing will blow your mind.";
        slidingMenuCell.detailTextLabel.font = [UIFont fontWithName:@"TimesNewRomanPS" size:20];
        slidingMenuCell.backgroundImageView.image = [UIImage imageNamed:@"apple_celeriac_soup.png"];
        
    }
    else if(row == 2){
        slidingMenuCell.textLabel.text = @"Aubergine Daal";
        slidingMenuCell.textLabel.font = [UIFont fontWithName:@"TimesNewRomanPS-ItalicMT" size:35];
        
        slidingMenuCell.detailTextLabel.text = @"Try this lentil recipe out...";
        slidingMenuCell.detailTextLabel.font = [UIFont fontWithName:@"TimesNewRomanPS" size:20];
        slidingMenuCell.backgroundImageView.image = [UIImage imageNamed:@"daal.png"];

    }
    else if(row == 3){
        slidingMenuCell.textLabel.text = @"Salmon Fish Cakes";
        slidingMenuCell.textLabel.font = [UIFont fontWithName:@"TimesNewRomanPS-ItalicMT" size:35];
        
        slidingMenuCell.detailTextLabel.text = @"Great for the whole family";
        slidingMenuCell.detailTextLabel.font = [UIFont fontWithName:@"TimesNewRomanPS" size:20];
        slidingMenuCell.backgroundImageView.image = [UIImage imageNamed:@"cake.png"];
        
    }

    
}

- (void)slidingMenu:(RPSlidingMenuViewController *)slidingMenu didSelectItemAtRow:(NSInteger)row{
    
    [super slidingMenu:slidingMenu didSelectItemAtRow:row];
    
  /*  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    CSGrowHeaderViewController *detail = [storyboard instantiateViewControllerWithIdentifier:@"details"];
      [self.navigationController pushViewController:detail animated:YES];*/
   
}


@end