//
//  ViewController.m
//  Outside
//
//  Created by Amy Joscelyn on 2/16/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "ViewController.h"
#import "AMYForecastAPIClient.h"
#import "AMYCurrentForecast.h"
#import "AMYDailyForecast.h"

@interface ViewController ()

@property (strong, nonatomic) NSDate *dateOfLastAPIRequest;

@property (weak, nonatomic) IBOutlet UILabel *currentTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *iconLabel;

@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *latitude = @"40.7787902";
    NSString *longitude = @"-73.90658830000001";
    
    /* THIS IS CODE FOR LIMITING API REQUESTS, BUT ONLY AFTER I HAVE A WAY TO PERSIST DATA BETWEEN SESSIONS
    NSDate *currentDate = [NSDate date];
    
    NSDateFormatter *monthDayFormatter = [[NSDateFormatter alloc] init];
    [monthDayFormatter setDateFormat:@"MM-dd"];
    
    NSDateFormatter *hourFormatter = [[NSDateFormatter alloc] init];
    [hourFormatter setDateFormat:@"hh"];
    
    NSDateFormatter *minuteFormatter = [[NSDateFormatter alloc] init];
    [minuteFormatter setDateFormat:@"mm"];
    
    NSString *currentMonthDay = [monthDayFormatter stringFromDate:currentDate];
    NSString *currentHour = [hourFormatter stringFromDate:currentDate];
    NSString *currentMinute = [minuteFormatter stringFromDate:currentDate];
    
    NSString *lastSavedMonthDay = [monthDayFormatter stringFromDate:self.dateOfLastAPIRequest];
    NSString *lastSavedHour = [hourFormatter stringFromDate:self.dateOfLastAPIRequest];
    NSString *lastSavedMinute = [minuteFormatter stringFromDate:self.dateOfLastAPIRequest];
    
    NSInteger currentHourInt = currentHour.integerValue;
    NSInteger currentMinInt = currentMinute.integerValue;
    NSInteger savedHourInt = lastSavedHour.integerValue;
    NSInteger savedMinInt = lastSavedMinute.integerValue;
    
    if (![currentMonthDay isEqualToString:lastSavedMonthDay])
    {
        //continue on and do the API call
        //otherwise it's the same day, and you need to go to the else-if
    }
    else
    {
        NSLog(@"%li.%li (current) ///// %li.%li (saved)", currentHourInt, currentMinInt, savedHourInt, savedMinInt);
    }
    
    //if current date is half an hour difference from dateOfLast, show last API information--which means I need to save the information I retrieve.  Which means I'll need to use some kind of persistent data, because if they close out the app, I need to repopulate it with the same data.
     */
    
    [AMYForecastAPIClient getForecastForLatitude:latitude longitude:longitude completion:^(NSArray *dailyForecastModels)
     {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM/dd/yyyy hh:mm:ss"];
         
         //this is where I'll NSLog the individual pieces of info
         AMYCurrentForecast *today = dailyForecastModels[0];
         
         self.dateOfLastAPIRequest = today.date;
         
         NSLog(@"%@: %.2f/%.2f, it's currently %@ (%@)", [dateFormatter stringFromDate:today.date], today.temperature, today.apparentTemperature, today.weatherSummary, today.weatherIcon);
         
         
         if (today.temperature < today.apparentTemperature)
         {
             self.currentTempLabel.textColor = [UIColor redColor];
         }
         else if (today.temperature > today.apparentTemperature)
         {
             self.currentTempLabel.textColor = [UIColor blueColor];
         }
         else
         {
             self.currentTempLabel.textColor = [UIColor blackColor];
         }
         
         self.currentTempLabel.text = [NSString stringWithFormat:@"%.2f°F", today.apparentTemperature];
         
         /*
          clear day / sunny = 0
          slightly cloudy = 1
          Partly Cloudy (partly cloudy day) = 2
          mostly cloudy = 3
          Overcast (summary) = 4
          sunshowers = 5
          rain (icon) = 6 [Light rain (rain)]
          thunderstorm = 7
          lightning, no rain = 8
          snowstorm = 9
          windy = 10
          gentle breeze = 11
          foggy = 12
          clear night = 13
          */
         
         NSArray *weatherIcons = @[ @"☀️" , @"🌤" , @"⛅️" , @"🌥" , @"☁️" , @"🌦" , @"🌧" , @"⛈" , @"🌩" , @"🌨" , @"💨" , @"🌬🌾" , @"🌫" , @"✨🌙" ];
         
         if ([today.weatherSummary isEqualToString:@"Overcast"])
         {
             self.iconLabel.text = weatherIcons[4];
         }
         else if ([today.weatherIcon isEqualToString:@"rain"])
         {
             self.iconLabel.text = weatherIcons[6];
         }
         else if ([today.weatherSummary isEqualToString:@"Partly Cloudy"])
         {
             self.iconLabel.text = weatherIcons[2];
         }
         else
         {
             self.iconLabel.text = @":)";
         }
     }];
}

@end
