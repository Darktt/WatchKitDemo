//
//  WKColor.m
//  WatchTest
//
//  Created by EdenLi on 2015/4/10.
//  Copyright (c) 2015年 Darktt. All rights reserved.
//

#import "WKColor.h"

#import <UIKit/UIKit.h>

@interface WKColor ()
{
    NSArray *_colorComponents;
}

@end

@implementation WKColor

+ (instancetype)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
    WKColor *__autoreleasing color = [[WKColor alloc] initWithRed:red green:green blue:blue alpha:alpha];
    
    return color;
}

+ (instancetype)redColor
{
    return [self colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
}

+ (instancetype)blueColor
{
    return [self colorWithRed:0.0f green:0.0f blue:1.0f alpha:1.0f];
}

+ (instancetype)greenColor
{
    return [self colorWithRed:0.0f green:1.0f blue:0.0f alpha:1.0f];
}

+ (instancetype)blackColor
{
    return [self colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f];
}

+ (instancetype)whiteColor
{
    return [self colorWithRed:1.0f green:1.0f blue:1.0f alpha:1.0f];
}

+ (instancetype)colorWithColorComponents:(NSArray *)colorComponents
{
    WKColor *__autoreleasing color = [[WKColor alloc] initWithColorComponents:colorComponents];
    
    return color;
}

- (instancetype)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
    self = [super init];
    
    if (self == nil) {
        return nil;
    }
    
    _colorComponents = [NSArray arrayWithObjects:@(red), @(green), @(blue), @(alpha), nil];
    
    return self;
}

- (instancetype)initWithColorComponents:(NSArray *)colorComponents
{
    self = [super init];
    
    if (self == nil) {
        return nil;
    }
    
    _colorComponents = colorComponents;
    
    return self;
}

- (void)dealloc
{
    _colorComponents = nil;
}

- (CGFloat)colorComponentAtIndex:(NSUInteger)index
{
    NSNumber *component = _colorComponents[index];
    
    return component.doubleValue;
}

- (UIColor *)UIColor
{
    CGFloat red = [self colorComponentAtIndex:0];
    CGFloat green = [self colorComponentAtIndex:1];
    CGFloat blue = [self colorComponentAtIndex:2];
    CGFloat alpha = [self colorComponentAtIndex:3];
    
    UIColor *_color = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    
    return _color;
}

- (BOOL)isWhiteColor
{
    CGFloat red = [self colorComponentAtIndex:0];
    CGFloat green = [self colorComponentAtIndex:1];
    CGFloat blue = [self colorComponentAtIndex:2];
    CGFloat alpha = [self colorComponentAtIndex:3];
    
    return (red == 1.0f && green == 1.0f && blue == 1.0f && alpha == 1.0f);
}

- (NSArray *)colorComponents
{
    return _colorComponents;
}

@end