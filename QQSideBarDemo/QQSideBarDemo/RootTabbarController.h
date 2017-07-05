//
//  RootTabbarController.h
//  QQSideBarDemo
//
//  Created by etmedia on 2017/7/4.
//  Copyright © 2017年 etmedia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageViewController.h"
#import "ContactViewController.h"
#import "DynamicViewController.h"

@interface RootTabbarController : UITabBarController

@property (nonatomic, strong) MessageViewController * messageVC;

@property (nonatomic, strong) ContactViewController * contactVC;

@property (nonatomic, strong) DynamicViewController * dynamicVC;

@end
