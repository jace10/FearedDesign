//
//  HomePageVC.h
//  FearedDesign
//
//  Created by Jason Mather on 8/1/12.
//  Copyright (c) 2012 Jason Mather. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface HomePageVC : UIViewController <UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIButton *blueCircleButton;
@property (weak, nonatomic) IBOutlet UIImageView *imgHome;
@property (weak, nonatomic) IBOutlet UIImageView *imgContactUs;
@property (weak, nonatomic) IBOutlet UIImageView *imgPortfolio;
@property (weak, nonatomic) IBOutlet UIImageView *imgTeam;
@property (weak, nonatomic) IBOutlet UIImageView *imgBackground;

@end
