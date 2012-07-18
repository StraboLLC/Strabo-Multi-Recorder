//
//  ViewController.m
//  My Great Capture Recorder
//
//  Created by Thomas N Beatty on 7/9/12.
//  Copyright (c) 2012 Strabo, LLC. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController (InternalMethods)

-(void)presentCameraViewController;

@end

@interface RootViewController (STRCaptureViewControllerDelegate) <STRCaptureViewControllerDelegate>

-(void)parentShouldDismissCaptureViewController:(UIViewController *)sender;

@end

@implementation RootViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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

#pragma mark - Button Handling

-(IBAction)cameraButtonWasPressed:(id)sender {
    NSLog(@"Camera button was pressed. Now displaying camera view.");
    [self presentCameraViewController];
}

-(IBAction)listButtonWasPressed:(id)sender {
    NSLog(@"List button was pressed. Now displaying list view.");
    
}

@end

@implementation RootViewController (STRCaptureViewControllerDelegate)

-(void)parentShouldDismissCaptureViewController:(UIViewController *)sender {
    [sender dismissViewControllerAnimated:YES completion:nil];
}

@end

@implementation RootViewController (InternalMethods)

-(void)presentCameraViewController {
    STRCaptureViewController * cameraVC = [STRCaptureViewController captureManager];
    cameraVC.delegate = self;
    [self presentViewController:cameraVC animated:YES completion:nil];
}

@end