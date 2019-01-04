//
//  ViewController.m
//  LROCAlertController
//
//  Created by dalizi on 2018/12/26.
//  Copyright © 2018年 dalizi. All rights reserved.
//

#import "ViewController.h"
#import "LRAlertController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 100, 30)];
    [btn1 setTitle:@"默认" forState:UIControlStateNormal];
    [btn1 setBackgroundColor:[UIColor cyanColor]];
    [btn1 addTarget:self action:@selector(test1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
}

- (void)test1 {
    LRAlertController *vc = [LRAlertController alertControllerWithTitle:@"测试标题" message:@"胡椒粉和方法和发货发货发货附加费经纪人放假放假放假附加费附加费粉粉嫩嫩放哪 烦恼烦恼你放哪卡夫卡咖啡和解放军考减肥减肥九街坊放假放假放假胡椒粉和方法和发货发货发货附加费经纪人放假放假放假附加费附加费粉粉嫩嫩放哪 烦恼烦恼你放哪卡夫卡咖啡和解放军考减肥减肥九街坊放假放假放假胡椒粉和方法和发货发货发货附加费经纪人放假放假放假附加费附加费粉粉嫩嫩放哪 烦恼烦恼你放哪卡夫卡咖啡和解放军考减肥减肥九街坊放假放假放假胡椒粉和方法和发货发货发货附加费经纪人放假放假放假附加费附加费粉粉嫩嫩放哪 烦恼烦恼你放哪卡夫卡咖啡和解放军考减肥减肥九街坊放假放假放假胡椒粉和方法和发货发货发货附加费经纪人放假放假放假附加费附加费粉粉嫩嫩放哪 烦恼烦恼你放哪卡夫卡咖啡和解放军考减肥减肥九街坊放假放假放假胡椒粉和方法和发货发货发货附加费经纪人放假放假放假附加费附加费粉粉嫩嫩放哪 烦恼烦恼你放哪卡夫卡咖啡和解放军考减肥减肥九街坊放假放假放假胡椒粉和方法和发货发货发货附加费经纪人放假放假放假附加费附加费粉粉嫩嫩放哪 烦恼烦恼你放哪卡夫卡咖啡和解放军考减肥减肥九街坊放假放假放假胡椒粉和方法和发货发货发货附加费经纪人放假放假放假附加费附加费粉粉嫩嫩放哪 烦恼烦恼你放哪卡夫卡咖啡和解放军考减肥减肥九街坊放假放假放假胡椒粉和方法和发货发货发货附加费经纪人放假放假放假附加费附加费粉粉嫩嫩放哪 烦恼烦恼你放哪卡夫卡咖啡和解放军考减肥减肥九街坊放假放假放假胡椒粉和方法和发货发货发货附加费经纪人放假放假放假附加费附加费粉粉嫩嫩放哪 烦恼烦恼你放哪卡夫卡咖啡和解放军考减肥减肥九街坊放假放假放假胡椒粉和方法和发货发货发货附加费经纪人放假放假放假附加费附加费粉粉嫩嫩放哪 烦恼烦恼你放哪卡夫卡咖啡和解放军考减肥减肥九街坊放假放假放假胡椒粉和方法和发货发货发货附加费经纪人放假放假放假附加费附加费粉粉嫩嫩放哪 烦恼烦恼你放哪卡夫卡咖啡和解放军考减肥减肥九街坊放假放假放假"];
    //
    LRAlertAction *cancelAction = [LRAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(LRAlertAction * _Nonnull action) {
        NSLog(@"取消了");
    }];
    [vc addAction:cancelAction];
    
    LRAlertAction *sureAction = [LRAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(LRAlertAction * _Nonnull action) {
        NSLog(@"确定了");
    }];
    [vc addAction:sureAction];
    
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
