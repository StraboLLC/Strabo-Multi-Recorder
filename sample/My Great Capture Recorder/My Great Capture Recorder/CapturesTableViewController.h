//
//  CapturesTableViewController.h
//  My Great Capture Recorder
//
//  Created by Thomas N Beatty on 7/23/12.
//  Copyright (c) 2012 Strabo, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CaptureDetailViewController.h"

#import "multi-recorder-sdk.h"

@interface CapturesTableViewController : UITableViewController {
    
    // An array to hold the local captures
    NSArray * captureArray;
}

@end