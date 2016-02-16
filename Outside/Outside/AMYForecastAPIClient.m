//
//  AMYForecastAPIClient.m
//  Outside
//
//  Created by Amy Joscelyn on 2/16/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import <AFNetworking.h>
#import "AMYForecastAPIClient.h"
#import "AMYDailyForecast.h"

@implementation AMYForecastAPIClient

+ (void)getForecastForLatitude:(NSString *)latitude longitude:(NSString *)longitude completion:(void (^)(NSArray *))completion
{
    NSString *apiKey = @"8b870816198b0390d0f82df8eb0afb73";
    
    NSString *url = [NSString stringWithFormat:@"https://api.forecast.io/forecast/%@/%@,%@", apiKey, latitude, longitude];
    
    [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:url parameters:nil error:nil];
    
}

@end
