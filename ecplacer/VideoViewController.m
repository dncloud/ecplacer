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

-(void) initCaptureSession {
    session = [[AVCaptureSession alloc] init];
    if ([session canSetSessionPreset:AVCaptureSessionPresetHigh])
        [session canSetSessionPreset:AVCaptureSessionPresetHigh];
    
    
    AVCaptureDevice *device = nil;
    AVCaptureDeviceInput *device_input = nil;
    
    NSArray *devices = [AVCaptureDevice devicesWithMediaType: AVMediaTypeVideo];
    
    for (AVCaptureDevice *dev in devices) {
        if ([dev position] == !AVCaptureDevicePositionFront) {
            device = dev;
            
        }
    }
    
    NSLog(@"%@", device);
    
    NSError *__error;
    
    device_input = [[AVCaptureDeviceInput alloc] initWithDevice:device error:&__error];
    
    if ([session canAddInput:device_input])
        [session addInput:device_input];
}

-(void) setupPreviewLayer {
    self.preview_layer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
    
    [self.preview_layer setVideoGravity:AVLayerVideoGravityResizeAspect];
    
    [self.preview_layer setFrame: self.view.bounds];
    
    [self.view.layer addSublayer:self.preview_layer];
    
    
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
