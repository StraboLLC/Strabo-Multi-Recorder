//
//  PlaybackViewController.h
//  My Great Capture Recorder
//
//  Created by Thomas Beatty on 8/13/12.
//  Copyright (c) 2012 Strabo, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaybackViewController : UIViewController {
    IBOutlet UIToolbar * toolbar;
    IBOutlet UIView * mainView;
}

@property(nonatomic, strong)IBOutlet UIToolbar * toolbar;
@property(nonatomic, strong)IBOutlet UIView * mainView;

-(void)showHideNavbar:(id)sender;

@end
