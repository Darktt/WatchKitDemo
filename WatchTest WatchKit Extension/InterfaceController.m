//
//  InterfaceController.m
//  WatchTest WatchKit Extension
//
//  Created by EdenLi on 2015/4/9.
//  Copyright (c) 2015年 Darktt. All rights reserved.
//

#import "InterfaceController.h"

#import <DTWatchKit/DTWatchKit.h>

@interface InterfaceController()

- (IBAction)trggerButton:(id)sender;
- (IBAction)selectBaclgroundColor;
- (IBAction)showMap;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context
{
    [super awakeWithContext:context];
    
    
}

- (void)willActivate
{
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (void)handleUserActivity:(NSDictionary *)userInfo
{
    [super handleUserActivity:userInfo];
    
}

#pragma mark - Actions

- (void)trggerButton:(id)sender
{
    NSDictionary *userInfo = [NSDictionary alertEvent];
    [WKInterfaceController openParentApplication:userInfo reply:nil];
    
    NSURL *URL = [NSURL URLWithString:@"http://www.google.com"];
    
    [self updateUserActivity:@"com.darktt.watchTest.Activity" userInfo:nil webpageURL:URL];
}

- (void)selectBaclgroundColor
{
    [self pushControllerWithName:@"ColorList" context:nil];
}

- (void)showMap
{
    [self pushControllerWithName:@"Map" context:nil];
}

@end
