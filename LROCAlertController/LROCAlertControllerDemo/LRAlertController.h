//
//  LRAlertController.h
//  LROCAlertController
//
//  Created by dalizi on 2018/12/26.
//  Copyright © 2018年 dalizi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LRAlertAction.h"

@interface LRAlertController : UIViewController

@property (nonatomic, readonly) NSString *message;
@property (nonatomic, readonly) NSArray  <LRAlertAction *> *actions;

+ (instancetype)alertControllerWithTitle:(NSString *)title
                                 message:(NSString *)message;
- (void)addAction:(LRAlertAction *)action;

// 可修改项
@property (nonatomic,strong)   UIColor *titleColor;
@property (nonatomic,strong)   UIColor *messageColor;
@property (nonatomic,strong)   UIFont  *titleFont;
@property (nonatomic,strong)   UIFont  *messageFont;
@property (nonatomic,assign)   CGFloat actionHeight;

@end
