//
//  NSDictionary+WatchEvents.h
//  WatchTest
//
//  Created by EdenLi on 2015/4/10.
//  Copyright (c) 2015年 Darktt. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WKColor;

@interface NSDictionary (WatchEvents)

@property (readonly, getter=isAlertEvent) BOOL alertEvent;
@property (readonly, getter=isColorChangeEvent) BOOL colorChangeEvent;
@property (readonly) WKColor *color;

+ (instancetype)alertEvent;
+ (instancetype)colorChangeEventWithColor:(WKColor *)color;

@end
