//
//  CaptureDetailViewController.h
//  My Great Capture Recorder
//
//  Created by Thomas N Beatty on 7/23/12.
//  Copyright (c) 2012 Strabo, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "multi-recorder-SDK.h"

#import "PlaybackViewController.h"

@interface CaptureDetailViewController : UIViewController {
    // UI Elements
    IBOutlet UITextField * titleField;
    IBOutlet UILabel * dateLabel;
    IBOutlet UILabel * uploadSuccessLabel;
    IBOutlet UIButton * uploadButton;
    IBOutlet UIProgressView * progressView;
    IBOutlet UIImageView * thumbnailImage;
    IBOutlet UILabel * tokenLabel;
    
    STRCapture * _localCapture;
}

/**
 The STRCapture object associated with this detail view.
 */
@property(nonatomic, strong)STRCapture * localCapture;

/**
 Loads the PlaybackViewController with the local capture and presents the view
 */
-(IBAction)playButtonWasPressed:(id)sender;

/**
 An action called when the upload button is pressed.
 */
-(IBAction)uploadButtonWasPressed:(id)sender;

@end