//
//  HelpDetailViewController.h
//  WhoHelp
//
//  Created by cloud on 11-9-10.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Loud.h"

@interface HelpDetailViewController : UIViewController
{
@private
    Loud *loud_;
    UILabel *nameLabel_;
    UILabel *locaitonLabel_;
    UILabel *timeLabel_;
    UIImageView *avatarImage_;
    UITextView *contentTextView_;
}

@property (nonatomic, retain) Loud *loud;
@property (nonatomic, retain) IBOutlet UILabel *nameLabel;
@property (nonatomic, retain) IBOutlet UILabel *locationLabel;
@property (nonatomic, retain) IBOutlet UILabel *timeLabel;
@property (nonatomic, retain) IBOutlet UIImageView *avatarImage;
@property (nonatomic, retain) IBOutlet UITextView *contentTextView;

- (NSString *)addressFromLocationLon:(NSNumber *)lon locationLat:(NSNumber *)lat;
- (NSString *)descriptionForTime:(NSDate *)date;

@end