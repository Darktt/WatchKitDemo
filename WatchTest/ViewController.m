//
//  ViewController.m
//  WatchTest
//
//  Created by EdenLi on 2015/4/9.
//  Copyright (c) 2015年 Darktt. All rights reserved.
//

#import "ViewController.h"

#import <DTWatchKit/DTWatchKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()
{
    UIStatusBarStyle _statusBarStyle;
    
    CLLocationManager *_locationManager;
}

@end

@implementation ViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveWatchEvent:) name:kWatchEventNotification object:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view setUserInteractionEnabled:YES];
    
    _statusBarStyle = UIStatusBarStyleDefault;
    
    _locationManager = [CLLocationManager new];
    [_locationManager requestWhenInUseAuthorization];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    _locationManager = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return _statusBarStyle;
}

#pragma mark - Show Alert

- (void)showAlert
{
    UIAlertAction *OKAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Watch Event" message:@"Hello World !!" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:OKAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - Notification Observer

- (void)receiveWatchEvent:(NSNotification *)sender
{
    NSDictionary *userInfo = sender.userInfo;
    
    if (userInfo.colorChangeEvent) {
        WKColor *color = userInfo.color;
        
        [self.view setBackgroundColor:color.UIColor];
        
        _statusBarStyle = (color.whiteColor) ? UIStatusBarStyleDefault : UIStatusBarStyleLightContent;
        
        [self setNeedsStatusBarAppearanceUpdate];
    }
    
    if (!userInfo.alertEvent) {
        return;
    }
    
    [self showAlert];
}

@end
