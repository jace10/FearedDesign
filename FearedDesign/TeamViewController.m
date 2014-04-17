//
//  TeamViewController.m
//  FearedDesign
//
//  Created by Jason Mather on 8/1/12.
//  Copyright (c) 2012 Jason Mather. All rights reserved.
//

#import "TeamViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface TeamViewController (){
    NSMutableArray *teamMembers;
    BOOL viewButtonIsUp;
}


@end

@implementation TeamViewController
@synthesize portfolioButton;
@synthesize scrollView;
@synthesize otherViewsView;
@synthesize plusButtonOutle;



- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    viewButtonIsUp = NO;
    otherViewsView.layer.cornerRadius = 5.0;
    portfolioButton.layer.cornerRadius = 5.0;
    plusButtonOutle.layer.cornerRadius = 5.0;
    plusButtonOutle.clipsToBounds = YES;
    teamMembers = [[NSMutableArray alloc] initWithCapacity:2];
    NSMutableDictionary *tom = [NSMutableDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tom",@"Founder and Owner of FearedDesign",@"Graphic Designer, Specialized in Webpage Design",@"Tom@FearedDesign.com",@"Operator of @FearedDesign", nil] forKeys:[NSArray arrayWithObjects:@"name",@"position",@"jobDescription",@"contactInfo",@"responsibility", nil]];
    [teamMembers addObject:tom];
    NSMutableDictionary *ryan = [NSMutableDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Ryan",@"Founder and Owner of FearedDesign",@"Graphic Designer, Specialized in Logo Design",@"Ry@FearedDesign.com",@"Operator of FearedDesign Fb Page", nil] forKeys:[NSArray arrayWithObjects:@"name",@"position",@"jobDescription",@"contactInfo",@"responsibility", nil]];
    [teamMembers addObject:ryan];
    
    double currentY = 0;
    for(NSMutableDictionary *person in teamMembers){
        NSDictionary *info = [NSDictionary dictionaryWithDictionary:person];
        TeamView *tv = [[TeamView alloc] init];
        UIView *personCard = [tv frameAndInfo:CGRectMake(0, currentY, 320, 100) info:info];
        [scrollView addSubview:personCard];
        currentY = currentY + 100;
        if(currentY + 100 > scrollView.contentSize.height){
            [scrollView setContentSize:CGSizeMake(320, currentY+200)];
        }
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)plusButton:(id)sender {
    [self moveTabBar];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [self removeFromParentViewController];
}
-(void)moveTabBar{
    if(viewButtonIsUp){
        [UIView animateWithDuration:.5 animations:^{
            otherViewsView.frame = CGRectOffset(otherViewsView.frame, 205, 0);
            
        }];
        viewButtonIsUp = NO;
    }else{
        [UIView animateWithDuration:.5 animations:^{
            otherViewsView.frame = CGRectOffset(otherViewsView.frame, -205, 0);
            
        }];
        viewButtonIsUp = YES;
    }
}

- (IBAction)sameButton:(id)sender {
    [self moveTabBar];
}
@end
