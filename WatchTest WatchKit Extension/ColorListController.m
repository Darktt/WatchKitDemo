//
//  ColorListController.m
//  WatchTest
//
//  Created by EdenLi on 2015/4/10.
//  Copyright (c) 2015年 Darktt. All rights reserved.
//

#import "ColorListController.h"

#import <DTWatchKit/DTWatchKit.h>

enum {
    kRedColorIndex = 0,
    kBlueColorIndex,
    kGreenColorIndex,
    kBlackColorIndex,
    kWhiteColorIndex
};

@interface ColorListRow : NSObject

@property (weak) IBOutlet WKInterfaceLabel *textLable;

@end

@implementation ColorListRow

@end

@interface ColorListController ()

@property (weak) IBOutlet WKInterfaceTable *table;

@end

@implementation ColorListController

- (void)awakeWithContext:(id)context
{
    [super awakeWithContext:context];
    
    [self setTitle:@"Colors"];
    
    NSArray *colors = @[@"Red", @"Blue", @"Green", @"Black", @"Default"];
    
    [self.table setNumberOfRows:colors.count withRowType:@"ColorListRow"];
    
    ColorListController *__weak weakSelf = self;
    void (^arrayEnumerate) (id, NSUInteger, BOOL *) = ^(NSString *colorName, NSUInteger idx, BOOL*stop) {
        ColorListRow *row = [weakSelf.table rowControllerAtIndex:idx];
        [row.textLable setText:colorName];
        [row.textLable setTextColor:[UIColor whiteColor]];
    };
    
    [colors enumerateObjectsUsingBlock:arrayEnumerate];
}

- (void)willActivate
{
    [super willActivate];
    
}

- (void)didDeactivate
{
    [super didDeactivate];
    
}

- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex
{
    WKColor *color = nil;
    
    if (rowIndex == kRedColorIndex) {
        color = [WKColor redColor];
    }
    
    if (rowIndex == kBlueColorIndex) {
        color = [WKColor blueColor];
    }
    
    if (rowIndex == kGreenColorIndex) {
        color = [WKColor greenColor];
    }
    
    if (rowIndex == kBlackColorIndex) {
        color = [WKColor blackColor];
    }
    
    if (rowIndex == kWhiteColorIndex) {
        color = [WKColor whiteColor];
    }
    
    NSDictionary *userInfo = [NSDictionary colorChangeEventWithColor:color];
    [WKInterfaceController openParentApplication:userInfo reply:nil];
}

@end
