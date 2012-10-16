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
@property (nonatomic, strong) CIContext * context;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (CIContext *)context {
    if (_context == nil) {
        _context = [CIContext contextWithOptions:nil];
    }
    return _context;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    debugMethod();

    // Session
    _session = [[AVCaptureSession alloc] init];
    _session.sessionPreset = AVCaptureSessionPreset352x288;

    // Input
    _videoDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    _videoInput = [AVCaptureDeviceInput deviceInputWithDevice:_videoDevice error:nil];

    // Output
    _frameOutput = [[AVCaptureVideoDataOutput alloc] init];
    _frameOutput.videoSettings = @{(id)kCVPixelBufferPixelFormatTypeKey : @(kCVPixelFormatType_32BGRA)};
    [_frameOutput setSampleBufferDelegate:self queue:dispatch_get_main_queue()];

    [_session addInput:_videoInput];
    [_session addOutput:_frameOutput];

    [_session startRunning];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection {
    CVPixelBufferRef pb = CMSampleBufferGetImageBuffer(sampleBuffer);
    CIImage * ciImage = [CIImage imageWithCVPixelBuffer:pb];

    CGImageRef ref = [self.context createCGImage:ciImage fromRect:ciImage.extent];
    _imageView.image = [UIImage imageWithCGImage:ref scale:1.0 orientation:(UIImageOrientationRight)];
    CFRelease(ref);
}

- (void)viewDidUnload {
    [self setImageView:nil];
    [super viewDidUnload];
}
@end




