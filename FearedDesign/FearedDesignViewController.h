//
//  FearedDesignViewController.h
//  FearedDesign
//
//  Created by Jason Mather on 8/1/12.
//  Copyright (c) 2012 Jason Mather. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "TeamViewController.h"
#import "ContactUsViewController.h"
#import "PortfolioViewController.h"

@interface FearedDesignViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *viewButton;
- (IBAction)viewButtonTouch:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *otherViewsView;
- (IBAction)sameButton:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *portfolioOutlet;
@end
