//
//  SJTransition.m
//  SJNavigationController
//
//  Created by jocentzhou on 2017/11/17.
//  Copyright © 2017年 jocentzhou. All rights reserved.
//

#import "SJTransition.h"

/** @name 获取屏幕 宽度、高度 */
// @{
#define SJ_SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SJ_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
// @}end of 获取屏幕 宽度、高度


@implementation SJTransition

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 2;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = (UIViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = (UIViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = fromVC.view;
    UIView *toView = toVC.view;
    
    UIView *containerView = transitionContext.containerView;
    [containerView addSubview:toView];
    [transitionContext.containerView bringSubviewToFront:fromView];

    if (transitionContext.isInteractive) {
        
    }
//    fromView.frame = CGRectMake(-SJ_SCREEN_WIDTH/2.0, 0, SJ_SCREEN_WIDTH, SJ_SCREEN_HEIGHT);
    toView.frame = CGRectMake(SJ_SCREEN_WIDTH, 0, SJ_SCREEN_WIDTH, SJ_SCREEN_HEIGHT);
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        toView.frame = CGRectMake(0, 0, SJ_SCREEN_WIDTH, SJ_SCREEN_HEIGHT);
//        toView.frame = CGRectMake(-SJ_SCREEN_WIDTH/2.0, 0, SJ_SCREEN_WIDTH, SJ_SCREEN_HEIGHT);

//        fromView.alpha = 0;
//        fromView.transform = CGAffineTransformMakeScale(0.2, 0.2);
//        toView.alpha = 1.0;
    } completion:^(BOOL finished) {
//        fromView.transform = CGAffineTransformMakeScale(1, 1);
        [transitionContext completeTransition:YES];
    }];
}

@end
