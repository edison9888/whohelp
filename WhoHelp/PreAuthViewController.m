//
//  PreAuthViewController.m
//  WhoHelp
//
//  Created by Dai Cloud on 11-12-23.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "PreAuthViewController.h"
#import "ASIHTTPRequest.h"
#import "Utils.h"
#import "ProfileManager.h"
#import "DoubanAuthViewController.h"
#import "WhoHelpAppDelegate.h"
#import "UIViewController+msg.h"
#import "CustomItems.h"


@implementation PreAuthViewController

@synthesize authLinkWeibo=_authLinkWeibo;
@synthesize authLinkDouban=_authLinkDouban;
@synthesize authLinkRenren=_authLinkRenren;
@synthesize myNavigationItem=_myNavigationItem;

#pragma mark - dealloc
- (void)dealloc
{
    [_authLinkWeibo release];
    [_authLinkRenren release];
    [_authLinkDouban release];
    [_myNavigationItem release];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"DismissPreAuthVC" object:nil];
    [super dealloc];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)dismissCurrentViewAction:(id) sender
{   
    [self dismissModalViewControllerAnimated:NO];
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"login.png"]];
    // Do any additional setup after loading the view from its nib.
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(dismissCurrentViewAction:) 
                                                 name:@"DismissPreAuthVC" 
                                               object:nil];
    
    [self.authLinkWeibo setImage:[UIImage imageNamed:@"lweiboo.png"] forState:UIControlStateNormal];
    [self.authLinkWeibo setImage:[UIImage imageNamed:@"lweibox.png"] forState:UIControlStateHighlighted];
    
    [self.authLinkRenren setImage:[UIImage imageNamed:@"lrenreno.png"] forState:UIControlStateNormal];
    [self.authLinkRenren setImage:[UIImage imageNamed:@"lrenrenx.png"] forState:UIControlStateHighlighted];
    
    [self.authLinkDouban setImage:[UIImage imageNamed:@"ldoubano.png"] forState:UIControlStateNormal];
    [self.authLinkDouban setImage:[UIImage imageNamed:@"ldoubanx.png"] forState:UIControlStateHighlighted];
    
    self.myNavigationItem.leftBarButtonItem = [[[CustomBarButtonItem alloc] 
                                                initBackBarButtonItemWithTarget:self 
                                                action:@selector(backAction:)] autorelease];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self 
                                                    name:@"DismissPreAuthVC" 
                                                  object:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Actions
- (IBAction)linkToAuthDouban:(id)sender
{
//    [self authRequest:@"/auth/weibo"];
}

- (IBAction)linkToAuthWeibo:(id)sender
{
    [self authRequest:@"/auth/weibo"];
}

- (IBAction)linkToAuthRenren:(id)sender
{
//    [self authRequest:@"/auth/renren"];
}


- (void)authRequest: (NSString *)path
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?uid=%@", HOST, path, [[UIDevice currentDevice] uniqueIdentifier]]];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setDelegate:self];
    [request startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    // Use when fetching text data
    NSString *responseString = [request responseString];

    
    // Use when fetching binary data
    //NSData *responseData = [request responseData];

    DoubanAuthViewController *webVC = [[DoubanAuthViewController alloc] initWithNibName:@"DoubanAuthViewController" bundle:nil];

    webVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    webVC.baseURL = request.url;
    webVC.body = responseString;
    [self presentModalViewController:webVC animated:YES];
    
    [webVC release];
    
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSError *error = [request error];
    [self fadeOutMsgWithText:@"网络链接错误" rect:CGRectMake(0, 0, 80, 66)];
    NSLog(@"%@", [error description]);
}

- (void)backAction:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}


@end
