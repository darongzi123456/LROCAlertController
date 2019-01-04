//
//  UIDevice+LRFoundation.m
//  LROCAlertController
//
//  Created by dalizi on 2019/1/4.
//  Copyright © 2019年 dalizi. All rights reserved.
//

#import "UIDevice+LRFoundation.h"

@implementation UIDevice (LRFoundation)

+ (BOOL)lr_hasTopNotch {
    static BOOL notch = NO;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (@available(iOS 11.0, *)) {
            if ([UIApplication sharedApplication].delegate &&
                [UIApplication sharedApplication].delegate.window.safeAreaInsets.top > 20) {
                notch = YES;
            } else {
                notch = NO;
            }
        } else {
            notch = NO;
        }
    });
    return notch;
}


@end
