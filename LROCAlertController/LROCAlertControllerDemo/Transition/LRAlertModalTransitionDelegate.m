//
//  LRAlertModalTransitionDelegate.m
//  LROCAlertController
//
//  Created by dalizi on 2018/12/26.
//  Copyright © 2018年 dalizi. All rights reserved.
//
#import "LRAlertModalTransitionDelegate.h"
#import "LRAlertAnimationController.h"
#import "LRAlertPresentationController.h"
#import "LRAlertUtil.h"

@implementation LRAlertModalTransitionDelegate

- (instancetype)init {
    if (self = [super init]) {
        _presentedViewSize = LRPresentedViewDefaultSize;
    }
    return self;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    LRAlertAnimationController *alertAnimationController = [LRAlertAnimationController new];
    alertAnimationController.presentedViewSize = self.presentedViewSize;
    return alertAnimationController;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    LRAlertAnimationController *alertAnimationController = [LRAlertAnimationController new];
    alertAnimationController.presentedViewSize = self.presentedViewSize;
    return alertAnimationController;
}

- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source {
    LRAlertPresentationController *alertPresentationController = [[LRAlertPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    alertPresentationController.presentedViewSize = self.presentedViewSize;
    return alertPresentationController;
}

@end
