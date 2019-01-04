//
//  LRAlertController.m
//  LROCAlertController
//
//  Created by dalizi on 2018/12/26.
//  Copyright © 2018年 dalizi. All rights reserved.
//

#import "LRAlertController.h"
#import "LRAlertModalTransitionDelegate.h"
#import "LRAlertUtil.h"

@interface LRAlertController ()

@property (nonatomic, copy)   NSString     *message;
@property (nonatomic, strong) UILabel      *titleLabel;
@property (nonatomic, strong) UILabel      *messageLabel;

@property (nonatomic, assign) CGFloat      alertViewWidth;
@property (nonatomic, assign) UIEdgeInsets titleEdgeInsets;
@property (nonatomic, assign) UIEdgeInsets messageEdgeInsets;
@property (nonatomic, assign) CGFloat      messageHeight;

@property (nonatomic, strong) NSMutableArray<LRAlertAction *>    *privateActions;
@property (nonatomic, strong) NSMutableArray<UIButton *>         *actionButtons;
@property (nonatomic, strong) LRAlertModalTransitionDelegate     *alertModalTransitionDelegate;

@end

@implementation LRAlertController

#pragma mark - Life Cycle

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message {
    if (self = [super init]) {
        self.title         = title;
        _message           = message;
        _alertViewWidth    = kAlertViewDefaultWidth;
        _titleColor        = [UIColor blackColor];
        _messageColor      = [UIColor darkGrayColor];
        _titleFont         = [UIFont systemFontOfSize:17];
        _messageFont       = [UIFont systemFontOfSize:15];
        _actionHeight      = 0; //默认为0
        _titleEdgeInsets   = UIEdgeInsetsMake(25, 25, 15, 25);
        _messageEdgeInsets = UIEdgeInsetsMake(25, 25, 25, 25);
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.transitioningDelegate = self.alertModalTransitionDelegate;
    }
    return self;
}

+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message {
    LRAlertController *alertController = [[LRAlertController alloc] initWithTitle:title message:message];
    alertController.alertModalTransitionDelegate.presentedViewSize = [alertController sizeOfAlertView];
    return alertController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addPageSubviews];
}

#pragma mark - Event Response

- (void)actionButonResponse:(UIButton *)button {
    NSInteger index = button.tag - TAGDESCRIPTION;
    if (index < 0) {
        return;
    }
    if (index >= self.privateActions.count) {
        return;
    }
    [self.presentingViewController dismissViewControllerAnimated:YES completion:^{
        LRAlertAction *alertAction = self.privateActions[index];
        !alertAction.handler ?: alertAction.handler(alertAction);
    }];
}

#pragma mark - Public Method

- (void)addAction:(LRAlertAction *)action {
    if (!action) return;
    if (![action isKindOfClass:[LRAlertAction class]]) return;
    if ([self.actions containsObject:action]) return;
    
    [self.privateActions addObject:action];
    
    if (self.actionHeight <= 0) {
        self.actionHeight = 45;
        CGFloat oldHeight = self.alertModalTransitionDelegate.presentedViewSize.height;
        CGFloat newHeight = oldHeight + self.actionHeight;
        self.alertModalTransitionDelegate.presentedViewSize = CGSizeMake(self.alertViewWidth,newHeight);
    }
    
    __weak typeof(self) weakSelf = self;
    action.propertyEvent = ^(LRAlertAction *action) {
        NSInteger tag  = [weakSelf.privateActions indexOfObject:action] + TAGDESCRIPTION;
        [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[UIButton class]] && obj.tag == tag) {
                UIButton *btn = (UIButton *)obj;
                if (action.titleColor != nil) {
                    [btn setTitleColor:action.titleColor forState:UIControlStateNormal];
                }
                if (action.titleFont != nil) {
                    btn.titleLabel.font = action.titleFont;
                }
                *stop = YES;
            }
        }];
    };
}

- (void)setTitleColor:(UIColor *)titleColor {
    if (self.title.length == 0) {
        return;
    }
    _titleColor = titleColor;
    _titleLabel.textColor = titleColor;
}

- (void)setMessageColor:(UIColor *)messageColor {
    if (self.message.length == 0) {
        return;
    }
    _messageColor = messageColor;
    _messageLabel.textColor = messageColor;
}

- (void)setTitleFont:(UIFont *)titleFont {
    if (self.title.length == 0) {
        return;
    }
    _titleFont = titleFont;
    _titleLabel.font = titleFont;
}

- (void)setMessageFont:(UIFont *)messageFont {
    if (self.message.length == 0) {
        return;
    }
    _messageFont = messageFont;
    _messageLabel.font = messageFont;
    [self updateContraints];
}

- (void)setActionHeight:(CGFloat)actionHeight {
    _actionHeight = actionHeight;
}

#pragma mark - update

- (void)updateContraints {
    self.alertModalTransitionDelegate.presentedViewSize = [self sizeOfAlertView];
}

#pragma mark - Private Method

- (void)addPageSubviews {
    //
    if (self.title.length > 0) {
        [self.view addSubview:self.titleLabel];
        [self.titleLabel sizeToFit];
        CGSize  size = self.titleLabel.frame.size;
        CGFloat Y    = self.titleEdgeInsets.top;
        self.titleLabel.frame = CGRectMake(0, Y, self.alertViewWidth, size.height);
    }
    //
    if (self.message.length > 0) {
        [self.view addSubview:self.messageLabel];
        CGFloat X = self.messageEdgeInsets.left;
        CGFloat Y = self.title.length > 0 ? CGRectGetMaxY(self.titleLabel.frame) + self.titleEdgeInsets.bottom : self.messageEdgeInsets.top;
        CGFloat W = self.alertViewWidth - self.messageEdgeInsets.left - self.messageEdgeInsets.right;
        self.messageLabel.frame = CGRectMake(X, Y, W, self.messageHeight);
    }
    //
    CGFloat ActionW = self.alertViewWidth / self.privateActions.count;
    CGFloat ActionY = self.message.length > 0 ? CGRectGetMaxY(self.messageLabel.frame)+self.messageEdgeInsets.bottom: CGRectGetMaxY(self.titleLabel.frame) + self.titleEdgeInsets.bottom;
    // privateActions只有一个的时候，文字默认为橘色
    for (int index = 0; index < self.privateActions.count; index++) {
        LRAlertAction *alertAction = self.privateActions[index];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = index + TAGDESCRIPTION;
        button.frame = CGRectMake(index * ActionW, ActionY, ActionW, self.actionHeight);
        button.titleLabel.font = [UIFont systemFontOfSize:17];
        [button setTitle:alertAction.title ?: @"" forState:UIControlStateNormal];
        //
        if (self.privateActions.count == 1) {
            [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        } else {
            if (index == 0) {
                [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            } else {
                [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            }
        }
        [button addTarget:self action:@selector(actionButonResponse:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        
        CGFloat scaleDistance = 1 / UIScreen.mainScreen.scale;
        CGFloat lineX;
        CGFloat lineY;
        CGFloat lineWidth;
        CGFloat lineHeight;
        
        if (index == 0) {
            lineWidth = self.alertViewWidth;
            lineHeight = scaleDistance;
            lineX = 0;
            lineY = ActionY - scaleDistance / 2;
        } else {
            lineWidth = scaleDistance;
            lineHeight = self.actionHeight - scaleDistance / 2;
            lineX = button.frame.origin.x - scaleDistance / 2;
            lineY = ActionY + scaleDistance / 2;
        }
        
        CALayer *lineLayer = [CALayer layer];
        lineLayer.frame = CGRectMake(lineX, lineY, lineWidth, lineHeight);
        lineLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
        [self.view.layer addSublayer:lineLayer];
    }
}

- (CGSize)sizeOfAlertView {
    CGFloat height = 0;
    if (self.title.length > 0) {
        CGFloat titleHeight = 20;
        height += self.titleEdgeInsets.top;
        height += titleHeight;
        height += self.titleEdgeInsets.bottom;
    }
    if (self.message.length > 0) {
        CGSize maxSize = CGSizeMake(self.alertViewWidth - self.messageEdgeInsets.left - self.messageEdgeInsets.right, MAXFLOAT);
        NSDictionary *attr = @{NSFontAttributeName : self.messageLabel.font};
        CGSize size = [self.message boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
        self.messageHeight = size.height + 1;
        CGFloat top = self.title.length > 0 ? 0: self.messageEdgeInsets.top;
        height += top;
        height += self.messageHeight;
        height += self.messageEdgeInsets.bottom;
    }
    if (height > ScreenHeight - StatusBarAndNavigationBarHeight - DangerAreaBottomHeight) {
        self.messageHeight = self.messageHeight - (height - (ScreenHeight - StatusBarAndNavigationBarHeight - DangerAreaBottomHeight));
        height = ScreenHeight - StatusBarAndNavigationBarHeight - DangerAreaBottomHeight;
    }
    return CGSizeMake(self.alertViewWidth, height);
}

#pragma mark - UITextViewDelegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    return NO;
}

#pragma mark - Getter and Setter

- (NSMutableArray<LRAlertAction *> *)privateActions {
    if (!_privateActions) {
        _privateActions = [NSMutableArray array];
    }
    return _privateActions;
}

- (LRAlertModalTransitionDelegate *)alertModalTransitionDelegate {
    if (!_alertModalTransitionDelegate) {
        _alertModalTransitionDelegate = [LRAlertModalTransitionDelegate new];
    }
    return _alertModalTransitionDelegate;
}

- (NSArray<LRAlertAction *> *)actions {
    return _privateActions.copy;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = self.titleFont;
        _titleLabel.textColor = self.titleColor;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = self.title ?: @"";
    }
    return _titleLabel;
}

- (UILabel *)messageLabel {
    if (!_messageLabel) {
        _messageLabel = [UILabel new];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.text = self.message ?: @"";
        _messageLabel.font = self.messageFont;
        _messageLabel.textColor = self.messageColor;
        _messageLabel.numberOfLines = 0;
    }
    return _messageLabel;
}

@end
