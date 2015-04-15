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

#pragma mark - Actions

- (void)trggerButton:(id)sender
{
    NSDictionary *userInfo = [NSDictionary alertEvent];
    [WKInterfaceController openParentApplication:userInfo reply:nil];
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
