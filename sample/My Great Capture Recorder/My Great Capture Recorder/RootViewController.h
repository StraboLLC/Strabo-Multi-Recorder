//
//  ViewController.h
//  My Great Capture Recorder
//
//  Created by Thomas N Beatty on 7/9/12.
//  Copyright (c) 2012 Strabo, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "STRCaptureViewController.h"

@interface RootViewController : UIViewController

// Button handling
-(IBAction)cameraButtonWasPressed:(id)sender;
-(IBAction)listButtonWasPressed:(id)sender;

@end