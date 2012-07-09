//
//  STRCaptureViewController.h
//  Toast
//
//  Created by Thomas Beatty on 6/28/12.
//  Copyright (c) 2012 Strabo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <QuartzCore/CAAnimation.h>

// Capture / Location Support
#import "STRCaptureDataCollector.h"
#import "STRGeoLocationData.h"

// Preferences
// #import "STRUserPreferencesManager.h"

@protocol STRCaptureViewControllerDelegate

@optional

-(void)locationServicesNotAuthorized;

@end

@interface STRCaptureViewController : UIViewController {
    
}

/**
 The parent object.
 
 The delegate of a STRCaptureViewController should implement a [STRCaptureViewControllerDelegate].
 */
@property(strong)id delegate;

+(STRCaptureViewController *)captureManager;

/**
 Called to handle rotation events without updating UIInterfaceOrientation
 */
-(void)deviceDidRotate;

///---------------------------------------------------------------------------------------
/// @name Button Handling
///---------------------------------------------------------------------------------------

-(IBAction)doneButtonWasPressed:(id)sender;
-(IBAction)recordButtonWasPressed:(id)sender;
    

@end
