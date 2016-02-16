//
//  ViewController.m
//  Outside
//
//  Created by Amy Joscelyn on 2/16/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "ViewController.h"
#import "AMYForecastAPIClient.h"
#import "AMYDailyForecast.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *latitude = @"40.7787902";
    NSString *longitude = @"-73.90658830000001";
    
    [AMYForecastAPIClient getForecastForLatitude:latitude longitude:longitude completion:^(NSArray *dailyForecastModels)
     {
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"MM/dd"];
        
         for (AMYDailyForecast *day in dailyForecastModels)
         {
             CGFloat maxTemp = day.temperatureMax;
             CGFloat minTemp = day.temperatureMin;
             NSString *dayDate = [format stringFromDate:day.date];
             NSLog(@"%@: %.2f, %.2f", dayDate, maxTemp, minTemp);
         }
    }];
}

@end
