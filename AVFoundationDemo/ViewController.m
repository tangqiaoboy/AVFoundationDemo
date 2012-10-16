//
//  ViewController.m
//  AVFoundationDemo
//
//  Created by TangQiao on 12-10-16.
//  Copyright (c) 2012年 TangQiao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) AVCaptureSession * session;
@property (nonatomic, strong) AVCaptureDevice * videoDevice;
@property (nonatomic, strong) AVCaptureDeviceInput * videoInput;
@property (nonatomic, strong) AVCaptureVideoDataOutput * frameOutput;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Session
    _session = [[AVCaptureSession alloc] init];
    _session.sessionPreset = AVCaptureSessionPreset352x288;

    // Input
    _videoDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    _videoInput = [AVCaptureDeviceInput deviceInputWithDevice:_videoDevice error:nil];

    // Output
    _frameOutput = [[AVCaptureVideoDataOutput alloc] init];
    _frameOutput.videoSettings = @{(id)kCVPixelBufferPixelFormatTypeKey : @(kCVPixelFormatType_32BGRA)};

    [_session addInput:_videoInput];
    [_session addOutput:_frameOutput];

    [_session startRunning];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
