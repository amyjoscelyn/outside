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
@property (weak, nonatomic) IBOutlet UILabel *iconLabel;

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
          mixed cloud and sun = 2
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
    }];
    
}

@end
