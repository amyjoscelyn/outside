//
//  AMYDailyForecast.h
//  Outside
//
//  Created by Amy Joscelyn on 2/16/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMYDailyForecast : NSObject

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, assign) float temperatureMax;
@property (nonatomic, assign) float temperatureMin;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
