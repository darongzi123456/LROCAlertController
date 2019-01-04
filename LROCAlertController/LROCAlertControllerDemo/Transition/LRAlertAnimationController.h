//
//  LRAlertAnimationController.h
//  LROCAlertController
//
//  Created by dalizi on 2018/12/26.
//  Copyright © 2018年 dalizi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LRAlertAnimationController : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) CGSize presentedViewSize;

@end
