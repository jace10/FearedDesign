//
//  PortfolioViewController.h
//  FearedDesign
//
//  Created by Jason Mather on 8/1/12.
//  Copyright (c) 2012 Jason Mather. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PortfolioViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *otherViewsView;
@property (weak, nonatomic) IBOutlet UIButton *plusButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *portfolioOutlet;
- (IBAction)plusButton:(id)sender;
- (IBAction)sameButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
