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
    IBOutlet UILabel * titleLabel;
}

-(void)loadInfoForCapture:(STRCapture *)capture;

@end
