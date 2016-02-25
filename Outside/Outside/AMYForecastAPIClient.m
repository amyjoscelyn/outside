//
//  AMYForecastAPIClient.m
//  Outside
//
//  Created by Amy Joscelyn on 2/16/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import <AFNetworking.h>
#import "AMYForecastAPIClient.h"
#import "AMYCurrentForecast.h"
#import "AMYDailyForecast.h"

@implementation AMYForecastAPIClient

+ (void)getForecastForLatitude:(NSString *)latitude longitude:(NSString *)longitude completion:(void (^)(NSArray *))completion
{
//    NSLog(@"we're inside the getForecast method");
    NSString *apiKey = @"8b870816198b0390d0f82df8eb0afb73";
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.forecast.io/forecast/%@/%@,%@", apiKey, latitude, longitude];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // this gets the current weather information
        NSDictionary *currentDictionary = responseObject[@"currently"];
        NSLog(@"currentDictionary: %@", currentDictionary);
        
        NSMutableArray *models = [NSMutableArray array];
        
        NSString *date = currentDictionary[@"time"];
        NSString *temp = currentDictionary[@"temperature"];
        NSString *apparentTemp = currentDictionary[@"apparentTemperature"];
        NSString *icon = currentDictionary[@"icon"];
        NSString *summary = currentDictionary[@"summary"];
        
        AMYCurrentForecast *model = [[AMYCurrentForecast alloc] initWithDate:date summary:summary icon:icon temperature:temp apparentTemperature:apparentTemp];
        
        [models addObject:model];

        completion(models);
        
        /* This gets the information for the daily data.
        NSArray *dayDictionaries = responseObject[@"daily"][@"data"];
         
        NSMutableArray *models = [NSMutableArray array];
        
        for (NSDictionary *dayDictionary in dayDictionaries)
        {
            AMYDailyForecast *model = [[AMYDailyForecast alloc] initWithDictionary:dayDictionary];
            [models addObject:model];
        }
        completion(models);
        */
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //code for error
        NSLog(@"ERROR: %@", error.localizedDescription);
    }];
    
}

@end
