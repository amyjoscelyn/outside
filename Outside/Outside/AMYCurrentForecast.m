//
//  AMYCurrentForecast.m
//  Outside
//
//  Created by Amy Joscelyn on 2/16/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "AMYCurrentForecast.h"

@implementation AMYCurrentForecast

- (instancetype)initWithDate:(NSString *)date summary:(NSString *)summary icon:(NSString *)icon temperature:(NSString *)temperature apparentTemperature:(NSString *)apparentTemperature
{
    self = [super init];
    if(self)
    {
        NSInteger timeSeconds = [date integerValue];
        _date = [NSDate dateWithTimeIntervalSince1970:timeSeconds];
        
        _weatherIcon = icon;
        _weatherSummary = summary;
        _temperature = [temperature floatValue];
        _apparentTemperature = [apparentTemperature floatValue];
    }
    return self;
}

@end
