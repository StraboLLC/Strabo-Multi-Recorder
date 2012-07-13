//
//  Capture.h
//  STRABO-MultiRecorder
//
//  Created by Thomas N Beatty on 7/12/12.
//  Copyright (c) 2012 Strabo, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Holds all of the information about a capture taken with the Strabo MultiRecorder.
 
 ##Creating a Capture object

 ##Editing a Capture object
 */
@interface STRCapture : NSObject {
    
}

///---------------------------------------------------------------------------------------
/// @name Class Methods
///---------------------------------------------------------------------------------------

/**
 Returns a new STRCapture object with the files at the directory
 */
+(STRCapture *)createCaptureFromFilesAtDirectory:(NSString *)captureDirectory;


@end
