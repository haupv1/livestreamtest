//
//  ViewController.m
//  LiveStreamTest
//
//  Created by Pham Van Hau on 5/14/18.
//  Copyright © 2018 Pham Van Hau. All rights reserved.
//

#import "ViewController.h"
#import "AVFoundation/AVFoundation.h"
#import "Vision/Vision.h"
#import "LFLiveSession.h"
@interface ViewController () <LFLiveSessionDelegate>
@property (nonatomic,strong) LFLiveSession* session;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self setupCaptureSession];
    self.session = [self session];
    [self startLive];
}
- (void) setupCaptureSession{
    // creates a new capture session
    AVCaptureSession* captureSession = [[AVCaptureSession alloc] init];
    
    // search for available capture devices
    AVCaptureDevice* availableDevices = [AVCaptureDevice defaultDeviceWithDeviceType: AVCaptureDeviceTypeBuiltInWideAngleCamera mediaType:AVMediaTypeVideo position:AVCaptureDevicePositionBack];
    
    // get capture device, add device input to capture session
    [captureSession addInput:[AVCaptureDeviceInput deviceInputWithDevice:availableDevices error:nil]];
    // setup output, add output to capture session
    AVCaptureVideoDataOutput* captureOutput = [[AVCaptureVideoDataOutput alloc] init];
    [captureSession addOutput:captureOutput];
//    [captureOutput setSampleBufferDelegate:self queue:dispatch_queue_create("videoQueue",DISPATCH_QUEUE_SERIAL)];
    AVCaptureVideoPreviewLayer* previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:captureSession];
    previewLayer.frame = self.view.frame;
    [self.view.layer addSublayer:previewLayer];
    [captureSession startRunning];
}
- (LFLiveSession*)session {
    if (!_session) {
        _session = [[LFLiveSession alloc] initWithAudioConfiguration:[LFLiveAudioConfiguration defaultConfiguration] videoConfiguration:[LFLiveVideoConfiguration defaultConfiguration]];
        _session.preView = self.view;
        _session.delegate = self;
    }
    return _session;
}

- (void)startLive {
    LFLiveStreamInfo *streamInfo = [LFLiveStreamInfo new];
    streamInfo.url = @"rtmp://35.200.103.168/live/test2";
    [self.session startLive:streamInfo];
}

- (void)stopLive {
    [self.session stopLive];
}

//MARK: - CallBack:
- (void)liveSession:(nullable LFLiveSession *)session liveStateDidChange: (LFLiveState)state{
    
}
- (void)liveSession:(nullable LFLiveSession *)session debugInfo:(nullable LFLiveDebug*)debugInfo{
    
}
- (void)liveSession:(nullable LFLiveSession*)session errorCode:(LFLiveSocketErrorCode)errorCode{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
