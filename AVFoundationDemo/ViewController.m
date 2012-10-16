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
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
