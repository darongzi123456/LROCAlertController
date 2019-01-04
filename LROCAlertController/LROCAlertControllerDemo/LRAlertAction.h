//
//  LRAlertAction.h
//  LROCAlertController
//
//  Created by dalizi on 2018/12/26.
//  Copyright © 2018年 dalizi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LRAlertAction : NSObject <NSCopying>

+ (instancetype)actionWithTitle:(nullable NSString *)title
                          style:(UIAlertActionStyle)style
                        handler:(void (^ __nullable)(LRAlertAction *action))handler;

@property (nonatomic,readonly) NSString           *title;
@property (nonatomic,readonly) UIAlertActionStyle style;
/*
 * titleColor:可修改
 * titleFont :可修改
 */
@property (nonatomic,strong)   UIColor            *titleColor;
@property (nonatomic,strong)   UIFont             *titleFont;


@property (nonatomic,copy)     void (^handler)(LRAlertAction *action);
/*
 *  当在addAction之后设置action属性时,会回调这个block,设置相应控件的字体、颜色等
 */
@property (nonatomic,copy)     void (^propertyEvent)(LRAlertAction *action);

@end

NS_ASSUME_NONNULL_END
