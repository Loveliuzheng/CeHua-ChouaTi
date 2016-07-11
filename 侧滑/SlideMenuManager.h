//
//  SlideMenuManager.h
//  侧滑
//
//  Created by GG on 16/7/1.
//  Copyright © 2016年 GG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/**
 *  滑动类型
 */
typedef NS_ENUM(NSInteger, SlidingType) {
    /**
     *  左侧
     */
    SlidingTypeFromLeft = 0,
    /**
     *  未完善
     */
    SlidingTypeFromLeftScale,
    /**
     *  未完善
     */
    SlidingTypeFromTop,
    /**
     *  未完善
     */
    SlidingTypeFromRight,
    /**
     *  未完善
     */
    SlidingTypeFromBottom
};

@interface SlideMenuManager : NSObject

/**
 *  单例方法
 */
+ (instancetype)shareManager;

/**
 *  设置需要滑动的两个控制器
 *
 *  @param mainViewController 主页控制器
 *  @param menuViewController 侧滑出的控制器
 *  @param slidingType        滑动类型
 */
- (void)startWithMainViewController:(UIViewController *)mainViewController menuViewController:(UIViewController *)menuViewController slidingType:(SlidingType)slidingType;


- (void)pressTheSwitchOfMenu;

@end
