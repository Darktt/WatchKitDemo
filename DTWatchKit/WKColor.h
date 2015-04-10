//
//  WKColor.h
//  WatchTest
//
//  Created by EdenLi on 2015/4/10.
//  Copyright (c) 2015年 Darktt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIGraphics.h>

@class UIColor;
@interface WKColor : NSObject

@property (readonly) UIColor *UIColor;
@property (readonly, getter=isWhiteColor) BOOL whiteColor;

+ (instancetype)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

@end
