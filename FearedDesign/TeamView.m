//
//  TeamView.m
//  FearedDesign
//
//  Created by Jason Mather on 8/1/12.
//  Copyright (c) 2012 Jason Mather. All rights reserved.
//

#import "TeamView.h"

@implementation TeamView{
    
    UILabel *nameLabel;
    UILabel *positionLabel;
    UILabel *jobDescriptionLabel;
    UILabel *contactInfoLabel;
    UILabel *responsibilityLabel;
    NSString *name;
    NSString *position;
    NSString *jobDescription;
    NSString *contactInfo;
    NSString *responsibility;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)frameAndInfo:(CGRect)frame info:(NSDictionary*)info{
    
    self.frame = frame;
    if (self) {
        name = [info objectForKey:@"name"];
        position = [info objectForKey:@"position"];
        jobDescription = [info objectForKey:@"jobDescription"];
        contactInfo = [info objectForKey:@"contactInfo"];
        responsibility = [info objectForKey:@"responsibility"];
        
        nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height/5)];
        [nameLabel setTextAlignment:NSTextAlignmentCenter];
        [nameLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        nameLabel.adjustsFontSizeToFitWidth = YES;
        [nameLabel setMinimumScaleFactor:.5];
        [nameLabel setText:name];
        
        [nameLabel setBackgroundColor:[UIColor clearColor]];
        [nameLabel setTextColor:[UIColor blackColor]];
        [self addSubview:nameLabel];
        
        positionLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x, nameLabel.frame.origin.y + nameLabel.frame.size.height, frame.size.width, frame.size.height/5)];
        [positionLabel setTextAlignment:NSTextAlignmentCenter];
        [positionLabel setBackgroundColor:[UIColor clearColor]];
        [positionLabel setTextColor:[UIColor blackColor]];
        [positionLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        positionLabel.adjustsFontSizeToFitWidth = YES;
        [positionLabel setMinimumScaleFactor:.5];
        [positionLabel setText:position];
        [self addSubview:positionLabel];
        
        jobDescriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x, positionLabel.frame.origin.y + positionLabel.frame.size.height, frame.size.width, frame.size.height/5)];
        [jobDescriptionLabel setTextAlignment:NSTextAlignmentCenter];
        [jobDescriptionLabel setBackgroundColor:[UIColor clearColor]];
        [jobDescriptionLabel setTextColor:[UIColor blackColor]];
        [jobDescriptionLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        jobDescriptionLabel.adjustsFontSizeToFitWidth = YES;
        [jobDescriptionLabel setMinimumScaleFactor:.5];
        [jobDescriptionLabel setText:jobDescription];
        [self addSubview:jobDescriptionLabel];
        
        contactInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x, jobDescriptionLabel.frame.origin.y + jobDescriptionLabel.frame.size.height, frame.size.width, frame.size.height/5)];
        [contactInfoLabel setTextAlignment:NSTextAlignmentCenter];
        [contactInfoLabel setBackgroundColor:[UIColor clearColor]];
        [contactInfoLabel setTextColor:[UIColor blackColor]];
        [contactInfoLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        contactInfoLabel.adjustsFontSizeToFitWidth = YES;
        [contactInfoLabel setMinimumScaleFactor:.5];
        [contactInfoLabel setText:contactInfo];
        [self addSubview:contactInfoLabel];
        
        responsibilityLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x, contactInfoLabel.frame.origin.y + contactInfoLabel.frame.size.height, frame.size.width, frame.size.height/5)];
        [responsibilityLabel setTextAlignment:NSTextAlignmentCenter];
        [responsibilityLabel setBackgroundColor:[UIColor clearColor]];
        [responsibilityLabel setTextColor:[UIColor blackColor]];
        [responsibilityLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        responsibilityLabel.adjustsFontSizeToFitWidth = YES;
        [responsibilityLabel setMinimumScaleFactor:.5];
        [responsibilityLabel setText:responsibility];
        [self addSubview:responsibilityLabel];
        
    }

    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
