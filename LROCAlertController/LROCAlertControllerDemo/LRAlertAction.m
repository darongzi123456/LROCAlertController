//
//  LRAlertAction.m
//  LROCAlertController
//
//  Created by dalizi on 2018/12/26.
//  Copyright © 2018年 dalizi. All rights reserved.
//

#import "LRAlertAction.h"

@interface LRAlertAction ()

@property (nullable, nonatomic) NSString           *title;
@property (nonatomic,assign)    UIAlertActionStyle style;

@end

@implementation LRAlertAction

- (id)copyWithZone:(NSZone *)zone {
    LRAlertAction *action = [[[self class] alloc] init];
    action.title = [self.title copy];
    action.style = self.style;
    action.titleColor = self.titleColor;
    action.titleFont = self.titleFont;
    action.handler = self.handler;
    return action;
}

+ (instancetype)actionWithTitle:(nullable NSString *)title
                          style:(UIAlertActionStyle)style
                        handler:(void (^ __nullable)(LRAlertAction *action))handler {
    LRAlertAction *action = [[self alloc] initWithTitle:title style:style handler:handler];
    return action;
    
}

- (instancetype)initWithTitle:(nullable NSString *)title
                        style:(UIAlertActionStyle)style
                      handler:(void (^ __nullable)(LRAlertAction *action))handler {
    if (self = [super init]) {
        self.title = title;
        self.style = style;
        self.handler = handler;
        
        if (style == UIAlertActionStyleDestructive) {
            self.titleColor = [UIColor redColor];
        } else if (style == UIAlertActionStyleCancel) {
            self.titleColor = [UIColor blueColor];
        } else {
            self.titleColor = [UIColor blackColor];
        }
    }
    return self;
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    if (self.propertyEvent) {
        self.propertyEvent(self);
    }
}

- (void)setTitleFont:(UIFont *)titleFont {
    _titleFont = titleFont;
    if (self.propertyEvent) {
        self.propertyEvent(self);
    }
}

@end
