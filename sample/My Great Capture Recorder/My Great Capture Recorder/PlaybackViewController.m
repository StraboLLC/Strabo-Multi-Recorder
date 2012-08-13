//
//  PlaybackViewController.m
//  My Great Capture Recorder
//
//  Created by Thomas Beatty on 8/13/12.
//  Copyright (c) 2012 Strabo, LLC. All rights reserved.
//

#import "PlaybackViewController.h"

@interface PlaybackViewController ()

@end

@implementation PlaybackViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Add a tap recognizer to the main view
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showHideNavbar:)];
    [_mainView addGestureRecognizer:tapGesture];
}

-(void)viewWillAppear:(BOOL)animated {
    // Get rid of the status bar
    
    // Set the navigation bar to be translucent
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
}

-(void)viewWillDisappear:(BOOL)animated {
    // Reset the navigation and status bars to default
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)showHideNavbar:(id)sender {
    if (self.navigationController.navigationBarHidden) {
        // Show the nav bar and controls
        [self.navigationController setNavigationBarHidden:NO animated:NO];
        [_toolbar setHidden:NO];
    } else {
        // Hide the nav bar and controls
        [self.navigationController setNavigationBarHidden:YES animated:NO];
        [_toolbar setHidden:YES];
    }
}

@end
