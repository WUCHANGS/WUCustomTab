//
//  MyTabBarController.m
//  WUCustomTab
//
//  Created by asun on 2018/3/26.
//  Copyright © 2018年 asun. All rights reserved.
//

#import "MyTabBarController.h"
#import "WUOneController.h"
#import "WUTwoController.h"
#import "WUThreeController.h"
#import "MyTabBarButton.h"

#define    HEXCOLOR(rgbValue)         HEXCOLORA(rgbValue, 1.0)
#define    HEXCOLORA(rgbValue, a)     [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:a]
#define    WIDTH                  [[UIScreen mainScreen] bounds].size.width

@interface MyTabBarController ()
@property (nonatomic,weak) UIButton *selectedButton;
@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createControllers];
    
    
    self.tabBar.backgroundColor = HEXCOLOR(0xffffff);
    self.tabBar.translucent = NO;
    // Do any additional setup after loading the view.
}
- (void)createControllers{
    WUOneController *oneVC = [[WUOneController alloc]init];
    WUTwoController *twoVC = [[WUTwoController alloc] init];
    WUThreeController *threeVc = [[WUThreeController alloc] init];
    
    NSArray *vcArr = @[oneVC,twoVC,threeVc];
    NSMutableArray *navVCArr = [NSMutableArray array];
    for (int i = 0; i < vcArr.count; i++) {
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vcArr[i]];
        [navVCArr addObject:nav];
        
    }
    self.viewControllers = navVCArr;
    
}
//这个是必不可少的，功能就是把系统自带的tabBar里的按钮移除，否者会重叠
//运行时候，发现在自定义tabbar里面并没有调用，系统自带的按钮依然像盖在
//上面，导致自己的tabbar里面按钮切换没有反应，之前的ios11以前都没有这个问题的。
//后来发现在-(void)viewDidAppear:(BOOL)animated里面重新调用删除系统自带tabbar按钮代码就可以了。
//我猜可能ios11里面-(void)viewWillAppear:(BOOL)animated调用的时候系统的tabbar按
//钮还没有完全创建，所以你调用删除代码没效果，但是ios11之前却没发生这种情况，
-(void)viewDidAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
    [self createTabBar];
}

/**
 *  创建TabBar
 */
- (void)createTabBar{
    // 2 创建button
    NSArray *titles = @[@"主页",@"嘀嘀",@"我的"];
    NSArray *images = @[@"主页",@"嘀嘀",@"我的"];
    
    for (NSInteger i = 0; i < titles.count; i++) {
        MyTabBarButton *button = [MyTabBarButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake((WIDTH/3.0) * i, 0, WIDTH/3.0, 49);
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        [button setTitleColor:HEXCOLOR(0x6b6b6b) forState:UIControlStateNormal];
        [button setTitleColor:HEXCOLOR(0xff645f) forState:UIControlStateSelected];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        button.titleLabel.font = [UIFont boldSystemFontOfSize:9];
        NSString *selectedImage = [NSString stringWithFormat:@"%@selected",images[i]];
        UIImage *image = [UIImage imageNamed:selectedImage];
        [button setImage:image forState:UIControlStateSelected];
        [button setImage:image forState:UIControlStateHighlighted];
        button.tag = 1000 + i;
        button.alpha = 1;
        [button addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i == self.tabBarSelectIndex) {
            button.selected = YES;
            self.selectedButton = button;
        }else{
            button.selected = NO;
        }
        [self.tabBar addSubview:button];
    }
}

- (void)selectAction:(MyTabBarButton *)button{
    if (button.tag != self.selectedButton.tag) {
        self.selectedButton.selected = NO;
        button.selected = YES;
        self.selectedButton = button;
        self.selectedIndex = self.selectedButton.tag - 1000;
    }
    self.tabBarSelectIndex = (NSInteger)self.selectedButton.tag -1000;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
