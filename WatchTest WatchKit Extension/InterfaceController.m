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
- (IBAction)redColor;
- (IBAction)blueColor;
- (IBAction)greenColor;
- (IBAction)blackColor;
- (IBAction)defaultColor;

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

- (void)redColor
{
    WKColor *color = [WKColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
    NSDictionary *userInfo = [NSDictionary colorChangeEventWithColor:color];
    [WKInterfaceController openParentApplication:userInfo reply:nil];
}

- (void)blueColor
{
    WKColor *color = [WKColor colorWithRed:0.0f green:0.0f blue:1.0f alpha:1.0f];
    NSDictionary *userInfo = [NSDictionary colorChangeEventWithColor:color];
    [WKInterfaceController openParentApplication:userInfo reply:nil];
}

- (void)greenColor
{
    WKColor *color = [WKColor colorWithRed:0.0f green:1.0f blue:0.0f alpha:1.0f];
    NSDictionary *userInfo = [NSDictionary colorChangeEventWithColor:color];
    [WKInterfaceController openParentApplication:userInfo reply:nil];
}

- (void)blackColor
{
    WKColor *color = [WKColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f];
    NSDictionary *userInfo = [NSDictionary colorChangeEventWithColor:color];
    [WKInterfaceController openParentApplication:userInfo reply:nil];
}

- (void)defaultColor
{
    WKColor *color = [WKColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:1.0f];
    NSDictionary *userInfo = [NSDictionary colorChangeEventWithColor:color];
    [WKInterfaceController openParentApplication:userInfo reply:nil];
}

@end



