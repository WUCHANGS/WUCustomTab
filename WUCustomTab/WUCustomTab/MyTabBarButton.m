//
//  MyTabBarButton.m
//  WUCustomTab
//
//  Created by asun on 2018/3/26.
//  Copyright © 2018年 asun. All rights reserved.
//

#import "MyTabBarButton.h"

@implementation MyTabBarButton

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return CGRectMake((contentRect.size.width - 24) / 2, 9, 24, 24);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    return  CGRectMake(contentRect.size.width * .15, 37, contentRect.size.width * .7, 11);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
