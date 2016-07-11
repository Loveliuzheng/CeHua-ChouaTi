//
//  SlideMenuManager.m
//  侧滑
//
//  Created by GG on 16/7/1.
//  Copyright © 2016年 GG. All rights reserved.
//

#import "SlideMenuManager.h"

@interface SlideMenuManager ()

@property (nonatomic, strong) UIViewController *mainViewController;

@property (nonatomic, strong) UIViewController *menuViewController;

@property (nonatomic, strong) UIViewController *rootViewController;



//侧边栏是否显示
@property (nonatomic, assign) BOOL isMenuShowing;

@end

static SlideMenuManager *manager = nil;
@implementation SlideMenuManager

+ (instancetype)shareManager{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [[SlideMenuManager alloc]init];
    });
    
    return manager;
    
}

- (void)startWithMainViewController:(UIViewController *)mainViewController menuViewController:(UIViewController *)menuViewController slidingType:(SlidingType)slidingType{
    
    
    self.mainViewController = mainViewController;
    self.menuViewController = menuViewController;
    
    if (self.menuViewController && self.mainViewController) {
        
        switch(slidingType) {
        
            case SlidingTypeFromLeft:{
                
                self.rootViewController = [[UIViewController alloc]init];
                
                [self.rootViewController addChildViewController:self.mainViewController];
                [self.rootViewController addChildViewController:self.menuViewController];
                
                [self.rootViewController.view addSubview:self.menuViewController.view];
                [self.rootViewController.view addSubview:self.mainViewController.view];
                
                
                
            }break;
            
            default:break;
        }
        
        
    }
    
    
    [UIApplication sharedApplication].keyWindow.rootViewController = _rootViewController;
    
    
    
}

- (void)pressTheSwitchOfMenu{
    
    if(_isMenuShowing){
        
        [self hideMenu];
    }else{
        
        [self showMenu];
    }
    
    
  
}

- (void)hideMenu{
    
    __weak typeof(self) weakSelf = self;
    
    /**
      damp: damping参数代表弹性阻尼，随着阻尼值越来越接近0.0，动画的弹性效果会越来越明显
     
      velocity:参数代表弹性修正速度，它表示视图在弹跳时恢复原位的速度
     
      options: UIViewAnimationOptionCurveLinear 线性动画  http://www.daxueit.com/article/5609.html
     
     
     */
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.05 options:UIViewAnimationOptionCurveLinear animations:^{
        
        weakSelf.mainViewController.view.frame = [UIScreen mainScreen].bounds;
        
        weakSelf.menuViewController.view.frame = CGRectMake(0, 0, 0, 736);
        
    } completion:^(BOOL finished) {
        
        _isMenuShowing = NO;
    }];
    
}

- (void)showMenu{
    
    __weak typeof(self) weakSelf = self;
    
    
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.05 options:UIViewAnimationOptionCurveLinear animations:^{
        
        
        
        weakSelf.menuViewController.view.frame = CGRectMake(0, 0, 250, 736);
        
        weakSelf.mainViewController.view.frame = CGRectMake(250, 0, 414-250, 736);
        
    } completion:^(BOOL finished) {
        
        _isMenuShowing = YES;
    }];

}
@end
