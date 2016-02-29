//
//  AMYForecastAPIClient.h
//  Outside
//
//  Created by Amy Joscelyn on 2/16/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMYForecastAPIClient : NSObject

+ (void)getForecastForLatitude:(NSString *)latitude longitude:(NSString *)longitude completion:(void (^)(NSArray *dailyForecastModels))completion;

- (void)startStandardUpdates;

@end
