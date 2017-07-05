//
//  SideMenuViewController.h
//  QQSideBarDemo
//
//  Created by etmedia on 2017/7/4.
//  Copyright © 2017年 etmedia. All rights reserved.
//

#import "BaseViewController.h"

@class SideMenuViewController;

@protocol SideMenuViewControllerDelegate <NSObject>

-(void)sideMenuViewController:(SideMenuViewController *)sideMenuVC clickMenuItem:(NSString *)title;

@end

@interface SideMenuViewController : BaseViewController

@property (weak, nonatomic) id<SideMenuViewControllerDelegate>delegate;

@end
