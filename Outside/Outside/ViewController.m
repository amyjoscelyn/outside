//
//  ViewController.m
//  Outside
//
//  Created by Amy Joscelyn on 2/16/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "ViewController.h"
#import "AMYForecastAPIClient.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *latitude = @"40.7787902";
    NSString *longitude = @"-73.90658830000001";
    
    [AMYForecastAPIClient getForecastForLatitude:latitude longitude:longitude completion:^(NSArray *dailyForecastModels) {
        NSLog(@"models: %@", dailyForecastModels);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
