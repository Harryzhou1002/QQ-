//
//  NavigationController.m
//  QQSideBarDemo
//
//  Created by etmedia on 2017/7/4.
//  Copyright © 2017年 etmedia. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationBarStyle];


}

-(void)setNavigationBarStyle
{
    [self.navigationBar setBackgroundImage:[[NavigationController CreateImageWithColor:[UIColor colorWithRed:0.204 green:0.722 blue:0.918 alpha:1]] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 1, 5, 1)] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationBar.barStyle = UIBarStyleBlack;
    
    
}

+ (UIImage *)CreateImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
    
}


@end
