# LROCAlertController

## LRAlertController

```
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

```
### LRAlertAction
```
+ (instancetype)actionWithTitle:(nullable NSString *)title
style:(UIAlertActionStyle)style
handler:(void (^ __nullable)(LRAlertAction *action))handler;

```
