//
//  HZTwinkleStar.m
//  TwinkleStarExample
//
//  Created by Hector Zarate on 5/22/13.
//  Copyright (c) 2013 Hector Zarate. All rights reserved.
//

#import "HZTwinkleStar.h"
#import <AVFoundation/AVFoundation.h>

#pragma mark - Constants

CGFloat kDefaultFrequency = 0.0;


#pragma mark - Other Functions Headers

NSTimeInterval TimeIntervalForFrequency(CGFloat frequency_in_hz);


@interface HZTwinkleStar ()

@property (nonatomic, weak) AVCaptureDevice *captureDevice;

-(void)setTorchMode:(AVCaptureTorchMode)paramTorchMode;

@end


@implementation HZTwinkleStar

#pragma mark - Initializers

-(id)init
{
    self = [super init];
    
    if (self)
    {
        _flashFrequency = kDefaultFrequency;
        _captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    }
    
    return self;
    
}

#pragma mark - Flash LED operations

-(void)turnFlashLEDOn
{
    if ([self isFlashLEDAvailable])
    {
        [self setTorchMode:AVCaptureTorchModeOn];
    }    
}

-(void)turnFlashLEDOff
{
    if ([self isFlashLEDAvailable])
    {
        [self setTorchMode:AVCaptureFlashModeOff];
    }
}


#pragma mark - Private Methods

-(void)setTorchMode:(AVCaptureTorchMode)paramTorchMode
{
    [self.captureDevice lockForConfiguration:nil];
    
    [self.captureDevice setTorchMode:paramTorchMode];
    
    [self.captureDevice unlockForConfiguration];
}


#pragma mark - Custom Accessors

-(BOOL)isFlashLEDAvailable
{
    BOOL result = ([self.captureDevice hasTorch] &&
                   [self.captureDevice isTorchAvailable]);
    
    return result;
}

@end


#pragma mark - Other Functions

NSTimeInterval TimeIntervalForFrequency(CGFloat frequency_in_hz)
{
    /*  period[s] = 1 / frequency[hz]   */
    
    if (frequency_in_hz == 0.0)
    {
        return DBL_MAX;
    }
    
    NSTimeInterval periodInterval = 1.0 / fabs(frequency_in_hz);
    
    return periodInterval;
}