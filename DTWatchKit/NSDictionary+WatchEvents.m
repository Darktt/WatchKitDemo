//
//  NSDictionary+WatchEvents.m
//  WatchTest
//
//  Created by EdenLi on 2015/4/10.
//  Copyright (c) 2015年 Darktt. All rights reserved.
//

#import "NSDictionary+WatchEvents.h"

#import <UIKit/UIKit.h>

#import "WKColor.h"

NSString *kWatchEventTypeKey = @"Event type";
NSString *kWatchEventTypeAlert = @"alert";
NSString *kWatchEventTypeColorChange = @"color change";

NSString *kWatchEventColorKey = @"color";

@interface WKColor (category)

@property (readonly) NSArray *colorComponents;

+ (instancetype)colorWithColorComponents:(NSArray *)colorComponents;

@end

#pragma mark - NSDictionary Category

@implementation NSDictionary (WatchEvents)

+ (instancetype)alertEvent
{
    NSDictionary *event = [NSDictionary dictionaryWithObject:kWatchEventTypeAlert forKey:kWatchEventTypeKey];
    
    return event;
}

+ (instancetype)colorChangeEventWithColor:(WKColor *)color
{
    NSDictionary *event = @{kWatchEventTypeKey: kWatchEventTypeColorChange, kWatchEventColorKey: color.colorComponents};
    
    return event;
}

#pragma mark - Override Property

- (BOOL)isAlertEvent
{
    NSArray *allValues = self.allValues;
    
    return [allValues containsObject:kWatchEventTypeAlert];
}

- (BOOL)isColorChangeEvent
{
    NSArray *allValues = self.allValues;
    
    return [allValues containsObject:kWatchEventTypeColorChange];
}

- (WKColor *)color
{
    if (!self.isColorChangeEvent) {
        return nil;
    }
    
    NSArray *colorComponents = self[kWatchEventColorKey];
    
    return [WKColor colorWithColorComponents:colorComponents];
}

@end
