//
//  AMYCurrentForecast.h
//  Outside
//
//  Created by Amy Joscelyn on 2/16/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMYCurrentForecast : NSObject

@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) NSString *weatherSummary;
@property (strong, nonatomic) NSString *weatherIcon;
@property (nonatomic) float temperature;
@property (nonatomic) float apparentTemperature;

- (instancetype)initWithDate:(NSString *)date summary:(NSString *)summary icon:(NSString *)icon temperature:(NSString *)temperature apparentTemperature:(NSString *)apparentTemperature;

@end
