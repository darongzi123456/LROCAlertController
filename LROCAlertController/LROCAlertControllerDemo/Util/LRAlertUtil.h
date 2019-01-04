//
//  LRAlertUtil.h
//  LROCAlertController
//
//  Created by dalizi on 2019/1/4.
//  Copyright © 2019年 dalizi. All rights reserved.
//

#ifndef LRAlertUtil_h
#define LRAlertUtil_h

#import "UIDevice+LRFoundation.h"
#import "UIView+Geometry.h"

#define kAlertViewDefaultWidth 282
#define TAGDESCRIPTION         999

#define ScreenHeight                    [UIScreen mainScreen].bounds.size.height
#define ScreenWidth                     [UIScreen mainScreen].bounds.size.width
#define LRPresentedViewDefaultSize      CGSizeMake(kAlertViewDefaultWidth , 300)
#define IS_IPHONEX                      ([UIDevice lr_hasTopNotch] ? YES : NO)
#define DangerAreaBottomHeight          ([UIDevice lr_hasTopNotch] ? 34.0f : 0.0f)
#define StatusBarAndNavigationBarHeight ([UIApplication sharedApplication].statusBarFrame.size.height + 44)


#endif /* LRAlertUtil_h */
