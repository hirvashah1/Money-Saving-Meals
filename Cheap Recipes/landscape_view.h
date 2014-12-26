//
//  landscape_view.h
//  Cheap Recipes
//
//  Created by Mike Choi on 8/2/14.
//  Copyright (c) 2014 LifePlus Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PWParallaxScrollView.h"

@interface landscape_view : UIViewController <PWParallaxScrollViewDelegate, PWParallaxScrollViewDataSource>

    @property (nonatomic, strong) PWParallaxScrollView *scrollView;
    @property (nonatomic, strong) NSArray *photos;

    @property (nonatomic, weak) IBOutlet UIPageControl *pageControl;

@end
