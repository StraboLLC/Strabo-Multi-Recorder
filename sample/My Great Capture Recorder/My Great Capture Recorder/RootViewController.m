//
//  ViewController.m
//  My Great Capture Recorder
//
//  Created by Thomas N Beatty on 7/9/12.
//  Copyright (c) 2012 Strabo, LLC. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController (STRCaptureViewControllerDelegate) <STRCaptureViewControllerDelegate>

-(void)parentShouldDismissCaptureViewController:(UIViewController *)sender;

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated {
    STRCaptureViewController * firstvc = [STRCaptureViewController captureManager];
    firstvc.delegate = self;
    [self presentViewController:firstvc animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

@implementation RootViewController (STRCaptureViewControllerDelegate)

-(void)parentShouldDismissCaptureViewController:(UIViewController *)sender {
    [sender dismissViewControllerAnimated:YES completion:nil];
}

@end