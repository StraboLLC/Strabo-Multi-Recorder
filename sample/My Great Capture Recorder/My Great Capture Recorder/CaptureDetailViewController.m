//
//  CaptureDetailViewController.m
//  My Great Capture Recorder
//
//  Created by Thomas N Beatty on 7/23/12.
//  Copyright (c) 2012 Strabo, LLC. All rights reserved.
//

#import "CaptureDetailViewController.h"

@interface CaptureDetailViewController ()

@end

@implementation CaptureDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadInfoForCapture:(STRCapture *)capture {
    titleLabel.text = capture.title;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
