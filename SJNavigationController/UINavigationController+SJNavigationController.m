//
//  UINavigationController+SJNavigationController.m
//  SJNavigationController
//
//  Created by jocentzhou on 2017/11/17.
//  Copyright © 2017年 jocentzhou. All rights reserved.
//

#import "UINavigationController+SJNavigationController.h"
#import "SJTransition.h"
#import <objc/runtime.h>

@interface UINavigationController ()<UINavigationControllerDelegate>

@end

@implementation UINavigationController (SJNavigationController)

+ (void)load {
    Method originMethod = class_getInstanceMethod(self, @selector(initWithRootViewController:));
    Method newMethod = class_getInstanceMethod(self, @selector(nav_initWithRootViewController:));
    method_exchangeImplementations(originMethod, newMethod);
}

- (instancetype)nav_initWithRootViewController:(UIViewController *)rootViewController {
    UINavigationController *temp = [self nav_initWithRootViewController:rootViewController];
    temp.delegate = self;
    return temp;
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
}

- (UIInterfaceOrientationMask)navigationControllerSupportedInterfaceOrientations:(UINavigationController *)navigationController NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)navigationControllerPreferredInterfaceOrientationForPresentation:(UINavigationController *)navigationController NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED {
    return UIInterfaceOrientationPortrait;
}

//- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
//                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController NS_AVAILABLE_IOS(7_0) {
//    return nil;
//}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0) {
    return [[SJTransition alloc] init];
}

@end
