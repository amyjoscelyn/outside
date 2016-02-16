//
//  ViewController.m
//  Outside
//
//  Created by Amy Joscelyn on 2/16/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "ViewController.h"
#import "AMYForecastAPIClient.h"
#import "AMYCurrentForecast.h"
#import "AMYDailyForecast.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *currentTempLabel;

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
         
         //this is where I'll NSLog the individual pieces of info
         AMYCurrentForecast *today = dailyForecastModels[0];
         
         NSLog(@"%@: %.2f/%.2f, it's currently %@ (%@)", today.date, today.temperature, today.apparentTemperature, today.weatherSummary, today.weatherIcon);
         
         /*
         for (AMYDailyForecast *day in dailyForecastModels)
         {
             CGFloat maxTemp = day.temperatureMax;
             CGFloat minTemp = day.temperatureMin;
             NSString *dayDate = [format stringFromDate:day.date];
             NSLog(@"%@: %.2f, %.2f", dayDate, maxTemp, minTemp);
         } */
    }];
}

@end
