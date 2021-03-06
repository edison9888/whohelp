//
//  PrizeTableCell.m
//  WhoHelp
//
//  Created by Dai Cloud on 12-1-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PrizeTableCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation PrizeTableCell

@synthesize  contentLabel, timeLabel, avatarImage, button, starLogo;

-(void)dealloc
{
    [contentLabel release];
    [timeLabel release];
    [avatarImage release];
    [button release];
    [starLogo release];
    
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier height:(CGFloat)contentHeight
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.contentView.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // all params 
        UIColor *smallFontColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:151/225.0 alpha:1.0];
        
        
        // about avatar image 
        self.avatarImage = [[[UIImageView alloc] initWithFrame:CGRectMake(12, 10, 35, 35)] autorelease];
        self.avatarImage.opaque = YES;
        
        [self.contentView addSubview:self.avatarImage];
        
        UIImageView *avatarImageFrame = [[[UIImageView alloc] initWithFrame:CGRectMake(12, 10, 35, 36)] autorelease];
        avatarImageFrame.image = [UIImage imageNamed:@"avatarFrameG.png"];
        avatarImageFrame.opaque = NO;
        avatarImageFrame.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:avatarImageFrame];
        
        self.starLogo = [[[UIImageView alloc] initWithFrame:CGRectMake(35, 33, 16, 16)] autorelease];
        self.starLogo.opaque = YES;
        self.starLogo.image = [UIImage imageNamed:@"star.png"];
        self.starLogo.hidden = YES;
        
        [self.contentView addSubview:self.starLogo];
        
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        self.button.frame = CGRectMake(12, 10, 35, 36);
        self.button.opaque = NO;
        self.button.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.button];
        
        // reply content view
        UIView *replyContentView = [[[UIView alloc] initWithFrame:CGRectMake(58, 10, 250, contentHeight+43)] autorelease];
        replyContentView.backgroundColor = [UIColor whiteColor];
        replyContentView.opaque = YES;
        // FIXME cost point
        replyContentView.clipsToBounds = NO;
        [replyContentView.layer setShadowColor:[[UIColor blackColor] CGColor]];
        [replyContentView.layer setShadowRadius:0.7f];
        [replyContentView.layer setShadowOffset:CGSizeMake(0, 1)];
        [replyContentView.layer setShadowOpacity:0.25f];
        [replyContentView.layer setCornerRadius:5.0f];
        
        // reply content view - content label
        self.contentLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10, 10, 228, contentHeight)] autorelease];
        self.contentLabel.backgroundColor = [UIColor clearColor];
        self.contentLabel.font = [UIFont systemFontOfSize:14.0f];
        self.contentLabel.textAlignment = UITextAlignmentLeft;
        self.contentLabel.numberOfLines = 0;
        self.contentLabel.lineBreakMode = UILineBreakModeWordWrap;
        
        [replyContentView addSubview:self.contentLabel];

        
        // reply content view - time show
        self.timeLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10, contentHeight+21, 140, 11)] autorelease];
        self.timeLabel.backgroundColor = [UIColor clearColor];
        self.timeLabel.opaque = NO;
        self.timeLabel.textAlignment = UITextAlignmentLeft;
        self.timeLabel.font = [UIFont systemFontOfSize:9.0f];
        self.timeLabel.textColor = smallFontColor;
        
        [replyContentView addSubview:self.timeLabel];
        
        [self.contentView addSubview:replyContentView];
        
        UIImageView *tri = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tri.png"]] autorelease];
        tri.frame = CGRectMake(50, 19, 8, 14);
        tri.backgroundColor = [UIColor clearColor];
        tri.opaque = NO;
        
        [self.contentView addSubview:tri];
        
        
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
