//
//  RootViewController.m
//  QQSideBarDemo
//
//  Created by etmedia on 2017/7/4.
//  Copyright © 2017年 etmedia. All rights reserved.
//

#import "RootViewController.h"
#import "RootTabbarController.h"
#import "SideMenuViewController.h"
#import "PurseViewController.h"

typedef NS_ENUM(NSInteger , State) {
   StateHome,
   StateMenu
};//状态 (Home or SideMenu)

static const CGFloat viewSlideScaleX = 0.75;

@interface RootViewController ()<SideMenuViewControllerDelegate,UITabBarControllerDelegate>

@property (strong, nonatomic) RootTabbarController * rootTabbarVC;
@property (strong, nonatomic) SideMenuViewController * sideMenuVC;

@property (strong, nonatomic) UIImageView * backgroundView;
@property (strong, nonatomic) UIView * coverView;

@property (strong, nonatomic) UITapGestureRecognizer * tapGR;
@property (strong, nonatomic) UIPanGestureRecognizer * panGR;
@property (assign, nonatomic) CGFloat distance;
@property (assign, nonatomic) CGFloat leftDistance;
@property (assign, nonatomic) CGFloat menuCenterStartX;
@property (assign, nonatomic) CGFloat menuCenterEndX;
@property (assign, nonatomic) CGFloat panStartX;
@property (assign, nonatomic) State state;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.backgroundView];
    [self.view addSubview:self.sideMenuVC.view];
//    [self.view addSubview:self.coverView];
    [self.view addSubview:self.rootTabbarVC.view];
    
    self.sideMenuVC.view.center = CGPointMake(self.view.center.x/2, self.view.center.y);
    self.sideMenuVC.delegate = self;
    
    _tapGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGR:)];
    _tapGR.enabled = NO;
    [self.rootTabbarVC.view addGestureRecognizer:_tapGR];
    
    _panGR = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGR:)];
    [self.rootTabbarVC.view addGestureRecognizer:_panGR];

    UITapGestureRecognizer * userImageTapGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapUserImage:)];
    [self.rootTabbarVC.messageVC.userIMG addGestureRecognizer:userImageTapGR];
    
   
    self.menuCenterStartX = self.view.bounds.size.width * viewSlideScaleX / 2;
    self.menuCenterEndX = self.view.center.x;
    self.leftDistance = self.view.bounds.size.width*viewSlideScaleX;
    self.state = StateHome;
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
    
}

-(void)tapUserImage:(UITapGestureRecognizer *)tapGR
{
    [self showSideMenu];
}

-(void)tapGR:(UITapGestureRecognizer *)tapGR
{
    [self showHome];
}

-(void)panGR:(UIPanGestureRecognizer *)panGR
{
    if (panGR.state == UIGestureRecognizerStateBegan) {
        self.panStartX = [panGR locationInView:self.view].x;
    
    }
    
    if (self.state == StateHome && self.panStartX >= 75) {
        return;
    }
    
    CGFloat x = [panGR translationInView:self.view].x;

    
    //禁止在主页面的时候向左滑动
    if (self.state == StateHome && x < 0) {
        return;
    }
    
    CGFloat distance = self.distance + x;
    if (panGR.state == UIGestureRecognizerStateEnded) {
        if (distance >= self.view.bounds.size.width * viewSlideScaleX / 2.0) {
            [self showSideMenu];
        }else{
            [self showHome];
        }
        return;
    }
    if (distance >= self.view.bounds.size.width * viewSlideScaleX || distance <= 0 ) {
        return;
    }
    
    self.rootTabbarVC.view.center = CGPointMake(self.view.center.x + distance, self.view.center.y);
   
    if (self.state == StateHome) {
        self.sideMenuVC.view.center = CGPointMake(self.view.center.x/2 + x/3, self.view.center.y);
    }else{
        self.sideMenuVC.view.center = CGPointMake(self.view.center.x + x/3, self.view.center.y);
    }
    
    
}

-(void)showSideMenu
{
    self.tapGR.enabled = YES;
    self.distance = self.leftDistance;
    self.state = StateMenu;
    [self doSlide:1];
}

-(void)showHome
{
    self.tapGR.enabled = NO;
    self.distance = 0;
    self.state = StateHome;
    [self doSlide:1];
    
}


// 滑动效果
-(void)doSlide:(CGFloat)proportion
{
    [UIView animateWithDuration:0.3 animations:^{
        self.rootTabbarVC.view.center = CGPointMake(self.view.center.x + self.distance, self.view.center.y);
        self.coverView.center = CGPointMake(self.view.center.x + self.distance, self.view.center.y);
        if (self.state == StateHome) {
            self.sideMenuVC.view.center = CGPointMake(self.view.center.x/2, self.view.center.y);
        }else{
            self.sideMenuVC.view.center = CGPointMake(self.view.center.x, self.view.center.y);
        }
    }];


}

#pragma mark - tabbarController delegate
//当点击某个标签时,tabBar触发该方法
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if (tabBarController.selectedIndex != 0) {
        _panGR.enabled = NO;
        _tapGR.enabled = NO;
    }else{
        _panGR.enabled = YES;
        _tapGR.enabled = NO;
    }
}

#pragma mark - SideMenuViewController delegate
-(void)sideMenuViewController:(SideMenuViewController *)sideMenuVC clickMenuItem:(NSString *)title
{
    if ([title isEqualToString:@"QQ钱包"]) {
        PurseViewController * purseVC = [[PurseViewController alloc]init];
        purseVC.hidesBottomBarWhenPushed = YES;
        [(UINavigationController *)[_rootTabbarVC.viewControllers objectAtIndex:_rootTabbarVC.selectedIndex] pushViewController:purseVC animated:YES];
        [self showHome];
    }
}



-(RootTabbarController *)rootTabbarVC
{
    if (_rootTabbarVC == nil) {
        _rootTabbarVC = [[RootTabbarController alloc]init];
        _rootTabbarVC.delegate = self;
    }
    return _rootTabbarVC;
}

-(SideMenuViewController *)sideMenuVC
{
    if(_sideMenuVC == nil)
    {
        _sideMenuVC = [[SideMenuViewController alloc]init];
    }
    return _sideMenuVC;
}

-(UIImageView *)backgroundView
{
    if (_backgroundView == nil) {
        _backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sideMenuBackground"]];
        _backgroundView.frame = self.view.bounds;
        [self.view addSubview:_backgroundView];
        
    }
    return _backgroundView;
}

//-(UIView *)coverView
//{
//    if (_coverView == nil) {
//        _coverView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
//        _coverView.backgroundColor = [UIColor blackColor];
//    }
//    return _coverView;
//}

@end
