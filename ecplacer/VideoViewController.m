//
//  VideoViewController.m
//  ecplacer
//
//  Created by Oliver Cermann on 13.07.18.
//  Copyright © 2018 Oliver Cermann. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()

@end

@implementation VideoViewController

- (void)viewWillAppear {
    [super viewDidLoad];
    
    self.customView1 = [[CustomView alloc] initWithFrame:self.view.bounds];

    [self.view setWantsLayer:YES];
    [self.view addSubview:self.customView1];
    
    [self initCaptureSession];
    [self setupPreviewLayer];
}

- (void)viewDidLoad {

}

-(void)initCaptureSession {
    session = [[AVCaptureSession alloc] init];
    if ([session canSetSessionPreset:AVCaptureSessionPresetHigh])
        [session canSetSessionPreset:AVCaptureSessionPresetHigh];
    
    AVCaptureDevice *device = nil;
    AVCaptureDeviceInput *device_input = nil;
    
    NSArray *devices = [AVCaptureDevice devicesWithMediaType: AVMediaTypeVideo];
 
    for (AVCaptureDevice *dev in devices) {
        device = dev;

        if (![[dev localizedName] isEqual: @"FaceTime HD Camera"] ) {
            device = dev;
            
            NSString *connectionStatus = @"Successfully connected to: ";

            [self.statusText setStringValue: [connectionStatus stringByAppendingString:dev.localizedName]];
        } else {
            [self.statusText setStringValue: @"Cannot found your camera. Please restart this program and try again..."];
        }
    }

    NSError *__error;
    device_input = [[AVCaptureDeviceInput alloc] initWithDevice:device error:&__error];
    
    if ([session canAddInput:device_input])
        [session addInput:device_input];
}

-(void)setupPreviewLayer {
    self.previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];

    [self.previewLayer setVideoGravity:AVLayerVideoGravityResizeAspect];
    [self.previewLayer setFrame: self.view.bounds];

    [self.view.layer addSublayer:self.previewLayer];
}

-(IBAction)start_click:(id)sender {
    if (![session isRunning])
        [session startRunning];
}

-(IBAction)stop_click:(id)sender {
    if ([session isRunning])
        [session stopRunning];
}

@end
