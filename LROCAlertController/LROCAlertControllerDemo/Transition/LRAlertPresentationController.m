//
//  LRAlertPresentationController.m
//  LROCAlertController
//
//  Created by dalizi on 2018/12/26.
//  Copyright © 2018年 dalizi. All rights reserved.
//

#import "LRAlertPresentationController.h"

@interface LRAlertPresentationController ()

@property (nonatomic, strong) UIView *dimmingView;

@end

@implementation LRAlertPresentationController

- (void)presentationTransitionWillBegin {
    self.dimmingView.frame = self.containerView.bounds;
    [self.containerView addSubview:self.dimmingView];
    
    [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.dimmingView.alpha = 0.5;
    } completion:nil];
}

- (void)dismissalTransitionWillBegin {
    [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.dimmingView.alpha = 0;
    } completion:nil];
}

- (void)containerViewWillLayoutSubviews {
    self.dimmingView.frame = self.containerView.bounds;
    
    self.presentedView.center = self.containerView.center;
    self.presentedView.bounds = CGRectMake(0, 0, self.presentedViewSize.width, self.presentedViewSize.height);
}

- (UIView *)dimmingView {
    if (!_dimmingView) {
        _dimmingView = [UIView new];
        _dimmingView.backgroundColor = [UIColor blackColor];
        _dimmingView.alpha = 0;
    }
    return _dimmingView;
}

@end
