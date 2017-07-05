//
//  RootTabbarController.m
//  QQSideBarDemo
//
//  Created by etmedia on 2017/7/4.
//  Copyright © 2017年 etmedia. All rights reserved.
//

#import "RootTabbarController.h"
#import "NavigationController.h"

@interface RootTabbarController ()

@end

@implementation RootTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NavigationController * navM = [[NavigationController alloc]initWithRootViewController:self.messageVC];
    
    NavigationController * navC = [[NavigationController alloc]initWithRootViewController:self.contactVC];
    
    NavigationController * navD = [[NavigationController alloc]initWithRootViewController:self.dynamicVC];
    
    
    self.viewControllers = @[navM, navC, navD];
    
}


-(MessageViewController *)messageVC
{
    if (_messageVC == nil) {
        _messageVC = [[MessageViewController alloc]init];
        _messageVC.tabBarItem.title = @"消息";
        [_messageVC.tabBarItem setImage:[UIImage imageNamed:@"tabBar_message"]];
        [_messageVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabBar_messageSE"]];
    }

    return _messageVC;
}

-(ContactViewController *)contactVC
{
    if (_contactVC == nil) {
        _contactVC = [[ContactViewController alloc]init];
        _contactVC.tabBarItem.title = @"联系人";
        [_contactVC.tabBarItem setImage:[UIImage imageNamed:@"tabBar_contactPerson"]];
        [_contactVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabBar_contactPersonSE"]];
    }
    return _contactVC;
}

-(DynamicViewController *)dynamicVC
{
    if (_dynamicVC == nil) {
        _dynamicVC = [[DynamicViewController alloc]init];
        _dynamicVC.tabBarItem.title = @"动态";
        [_dynamicVC.tabBarItem setImage:[UIImage imageNamed:@"tabBar_dynamic"]];
        [_dynamicVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabBar_dynamicSE"]];
    }
    return _dynamicVC;
}



@end
