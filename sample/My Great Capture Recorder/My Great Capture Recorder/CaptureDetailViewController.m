//
//  CaptureDetailViewController.m
//  My Great Capture Recorder
//
//  Created by Thomas N Beatty on 7/23/12.
//  Copyright (c) 2012 Strabo, LLC. All rights reserved.
//

#import "CaptureDetailViewController.h"

@interface CaptureDetailViewController (STRCaptureUploadManagerDelegate) <STRCaptureUploadManagerDelegate>

-(void)fileUploadDidStart;
-(void)fileUploadFailedToStart;
-(void)fileUploadDidProgress:(NSNumber *)progress;
-(void)fileUploadedSuccessfullyWithToken:(NSString *)token;
-(void)fileUploadDidStop;
-(void)fileUploadDidFailWithError:(NSError *)error;

@end

@interface CaptureDetailViewController (UITextFieldDelegate) <UITextFieldDelegate>

-(BOOL)textFieldShouldReturn:(UITextField *)textField;

@end

@interface CaptureDetailViewController (UITextViewDelegate) <UITextViewDelegate>

@end

@interface CaptureDetailViewController (InternalMethods)

/**
 Updates the user interface elements uploadButton and uploadSuccessLabel to reflect current upload status.
 */
-(void)refreshCaptureDetail;

/**
 Called to upload the _localCapture to the server using a STRCaptureUploadManager
 */
-(void)uploadCapture;

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

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    titleField.delegate = self;
    
//#warning Test Code Exists Below
}

-(void)viewWillAppear:(BOOL)animated {
    // Refresh all dynamic parts of the detail view
    [self refreshCaptureDetail];
}

-(void)viewWillDisappear:(BOOL)animated {
    // Save any changes made to the capture object
    _localCapture.title = titleField.text;
    [_localCapture save];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button Handling

-(IBAction)playButtonWasPressed:(id)sender {
    PlaybackViewController * player = [self.storyboard instantiateViewControllerWithIdentifier:@"playbackViewController"];
    [self.navigationController pushViewController:player animated:YES];
}

-(IBAction)uploadButtonWasPressed:(id)sender {
    // Upload the cature associated with this detail view
    [self uploadCapture];
}

@end

@implementation CaptureDetailViewController (STRCaptureUploadManagerDelegate)

-(void)fileUploadDidStart {
    NSLog(@"File upload did start.");
    // Show the progress view and reset the value to 0%
    [progressView setProgress:0.0 animated:NO];
    [progressView setHidden:NO];
}

-(void)fileUploadFailedToStart {
    [self refreshCaptureDetail];
    NSLog(@"File upload failed to start.");
}

-(void)fileUploadDidProgress:(NSNumber *)progress {
    // Update the progress view
    [progressView setProgress:[progress floatValue] animated:YES];
}

-(void)fileUploadedSuccessfullyWithToken:(NSString *)token {
    // Make sure the progress view reads 100%
    [progressView setProgress:1.0 animated:YES];
    // Save the upload date to the capture
    _localCapture.uploadDate = [NSDate date];
    [_localCapture save];
    // Refresh the user interface
    [self refreshCaptureDetail];
    NSLog(@"File uploaded successfully with token: %@.", token);
}

-(void)fileUploadDidStop {
    [self refreshCaptureDetail];
    NSLog(@"File upload did stop");
}

-(void)fileUploadDidFailWithError:(NSError *)error {
    [self refreshCaptureDetail];
    NSLog(@"File upload failed: %@", error.localizedDescription);
}

@end

@implementation CaptureDetailViewController (InternalMethods)

-(void)refreshCaptureDetail {
    if (!_localCapture.uploadDate) {
        // Hide the upload success label if the capture has not been uploaded.
        [uploadSuccessLabel setHidden:YES];
        [uploadButton setEnabled:YES];
    } else {
        // Show the upload label, as the capture has previously been uploaded.
        [uploadSuccessLabel setHidden:NO];
        [uploadButton setEnabled:NO];
    }
    // Either way, hide the progress view
    [progressView setHidden:YES];
    
    // Show the token for development purposes
    // You would not normally want to show this to the user
    tokenLabel.text = _localCapture.token;
    
    // Set up a date formatter to beautify the NSDate from the capture object
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy 'at' hh:mm a"];
    NSString * captureCreationDateString = [dateFormatter stringFromDate:_localCapture.creationDate];
    
    // Populate the view with the information from the capture
    titleField.text = _localCapture.title;
    dateLabel.text = captureCreationDateString;
    thumbnailImage.image = _localCapture.thumbnailImage;
}

-(void)uploadCapture {
    STRCaptureUploadManager * uploadManager = [STRCaptureUploadManager defaultManager];
    uploadManager.delegate = self;
    [uploadManager beginUploadForCapture:_localCapture];
}

@end

@implementation CaptureDetailViewController (UITextFieldDelegate)

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    // Hide the keyboard when the user presses the done button
    [textField resignFirstResponder];
    return NO;
}

@end

@implementation CaptureDetailViewController (UITextViewDelegate)

@end