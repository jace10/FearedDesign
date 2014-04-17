//
//  TeamViewController.h
//  FearedDesign
//
//  Created by Jason Mather on 8/1/12.
//  Copyright (c) 2012 Jason Mather. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeamView.h"

@interface TeamViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *otherViewsView;
@property (weak, nonatomic) IBOutlet UIButton *plusButtonOutle;
- (IBAction)plusButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *portfolioButton;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)sameButton:(id)sender;

@end
