//
//  VideoViewController.h
//  ecplacer
//
//  Created by Oliver Cermann on 13.07.18.
//  Copyright © 2018 Oliver Cermann. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AVFoundation/AVFoundation.h>
#import "CustomView.h"

@interface VideoViewController : NSViewController {
    AVCaptureSession *session;
    AVCaptureConnection *video_connection;
    AVCaptureOutput *image_output;
}

@property (nonatomic, retain) AVCaptureVideoPreviewLayer *preview_layer;
@property (nonatomic, retain) CustomView *customView1;
@property (nonatomic, retain) IBOutlet NSButton *startButton;
@property (nonatomic, retain) IBOutlet NSButton *stopButton;

-(IBAction)start_click:(id)sender;
-(IBAction)stop_click:(id)sender;

-(void) initCaptureSession;
-(void) setupPreviewLayer;

@end
