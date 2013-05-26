//
//  HZTwinkleStar.m
//  TwinkleStarExample
//
//  Created by Hector Zarate on 5/22/13.
//  Copyright (c) 2013 Hector Zarate. All rights reserved.
//

#import "HZTwinkleStar.h"


#pragma mark - Other Functions Headers

NSTimeInterval TimeIntervalForFrequency(CGFloat frequency_in_hz);


@implementation HZTwinkleStar

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