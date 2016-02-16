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
    NSLog(@"we're inside the getForecast method");
    NSString *apiKey = @"8b870816198b0390d0f82df8eb0afb73";
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.forecast.io/forecast/%@/%@,%@", apiKey, latitude, longitude];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //code for success
        NSArray *dayDictionaries = responseObject[@"daily"][@"data"];
        NSMutableArray *models = [NSMutableArray array];
        
        for (NSDictionary *dayDictionary in dayDictionaries)
        {
            AMYDailyForecast *model = [[AMYDailyForecast alloc] initWithDictionary:dayDictionary];
            [models addObject:model];
        }
        completion(models);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //code for error
        NSLog(@"ERROR: %@", error.localizedDescription);
    }];
    
    //This downloads a file.
//    NSURL *url = [NSURL URLWithString:urlString];
//    
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
// 
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    
//    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
//        
//        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
//        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
//        
//    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
//        
//        NSLog(@"File downloaded to: %@", filePath);
//    }];
//    [downloadTask resume];
}

@end
