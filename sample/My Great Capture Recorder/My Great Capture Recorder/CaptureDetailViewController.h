//
//  CaptureDetailViewController.h
//  My Great Capture Recorder
//
//  Created by Thomas N Beatty on 7/23/12.
//  Copyright (c) 2012 Strabo, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "multi-recorder-SDK.h"

@interface CaptureDetailViewController : UIViewController {
    // UI Elements
    IBOutlet UILabel * titleLabel;
    IBOutlet UILabel * tokenLabel;
    IBOutlet UIImageView * thumbnailImage;
    
    STRCapture * _localCapture;
}

@property(nonatomic, strong)STRCapture * localCapture;

@end
