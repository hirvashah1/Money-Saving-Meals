//
//  landscape_view.m
//  Cheap Recipes
//
//  Created by Mike Choi on 8/2/14.
//  Copyright (c) 2014 LifePlus Inc. All rights reserved.
//

#import "landscape_view.h"

@interface landscape_view ()

@end

@implementation landscape_view

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeRight;
}

- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)prev:(id)sender
{
    [_scrollView prevItem];
}

- (IBAction)next:(id)sender
{
    [_scrollView nextItem];
}


#pragma mark - PWParallaxScrollViewSource

- (NSInteger)numberOfItemsInScrollView:(PWParallaxScrollView *)scrollView
{
    self.pageControl.numberOfPages = [self.photos count];
    return self.pageControl.numberOfPages;
}

- (UIView *)backgroundViewAtIndex:(NSInteger)index scrollView:(PWParallaxScrollView *)scrollView
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.photos[index]]];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    return imageView;
}

- (UIView *)foregroundViewAtIndex:(NSInteger)index scrollView:(PWParallaxScrollView *)scrollView
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 300, 70)];
    [label setBackgroundColor:[UIColor blackColor]];
    [label setTextColor:[UIColor whiteColor]];
    [label setFont:[UIFont boldSystemFontOfSize:60.0f]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setText:[NSString stringWithFormat:@"Title %@", @(index + 1)]];
    [label setAlpha:0.7f];
    [label setUserInteractionEnabled:YES];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:label.bounds];
    [button setShowsTouchWhenHighlighted:YES];
    [button addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    [label addSubview:button];
    
    return label;
}

- (void)test
{
    NSLog(@"hit test");
}

#pragma mark - PWParallaxScrollViewDelegate

- (void)parallaxScrollView:(PWParallaxScrollView *)scrollView didChangeIndex:(NSInteger)index
{
    _pageControl.currentPage = index;
}

- (void)parallaxScrollView:(PWParallaxScrollView *)scrollView didEndDeceleratingAtIndex:(NSInteger)index
{
    
}

#pragma mark - view's life cycle

- (void)initControl
{
    self.scrollView = [[PWParallaxScrollView alloc] initWithFrame:self.view.bounds];
    
    //    _scrollView.foregroundScreenEdgeInsets = UIEdgeInsetsZero;
    _scrollView.foregroundScreenEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 100);
    [self.view insertSubview:_scrollView atIndex:0];
}

- (void)setContent:(id)content
{
    self.photos = @[@"ginger_honey_chicken_wings", @"apple_celeriac_soup"];
}

- (void)reloadData
{
    _scrollView.delegate = self;
    _scrollView.dataSource = self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self initControl];
    [self setContent:nil];
    [self reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end