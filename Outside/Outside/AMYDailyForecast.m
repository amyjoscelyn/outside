//
//  AMYDailyForecast.m
//  Outside
//
//  Created by Amy Joscelyn on 2/16/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "AMYDailyForecast.h"

@implementation AMYDailyForecast

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(self)
    {
        NSInteger timeSeconds = [dictionary[@"time"] integerValue];
        _date = [NSDate dateWithTimeIntervalSince1970:timeSeconds];
        
        _temperatureMax = [dictionary[@"temperatureMax"] floatValue];
        _temperatureMin = [dictionary[@"temperatureMin"] floatValue];
    }
    return self;
}

//do I know what this does?
-(NSUInteger)hash
{
    return [self.date hash];
}

-(BOOL)isEqual:(id)object
{
    if(self == object) return YES;
    if(![object isKindOfClass:self.class]) return NO;
    
    AMYDailyForecast *other = (AMYDailyForecast *)object;
    
    return [other.date isEqualToDate:self.date] &&
    other.temperatureMin == self.temperatureMin &&
    other.temperatureMax == self.temperatureMax;
}

@end
