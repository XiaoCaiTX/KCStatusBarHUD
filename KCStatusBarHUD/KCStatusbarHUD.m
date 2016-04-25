//
//  KCStatusbarHUD.m
//  KCStatusBarHUD
//
//  Created by Kevin on 16/4/25.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KCStatusbarHUD.h"

@implementation KCStatusbarHUD
static NSTimer *timer_;
static UIWindow *window_;
/** 指示器停留时间 */
static CGFloat const KCStayDuration = 2.0;
/** 动画下移或上移时间 */
static CGFloat const KCAnimationDuration = 0.5;
/** 图文间距 */
static CGFloat const KCTitleImageMargin = 10.0;
#pragma mark - 公共方法
+(void)setupText:(NSString *)text image:(UIImage *)image{
    
    CGRect showF  = [UIApplication sharedApplication].statusBarFrame;
    CGRect hideF = CGRectMake(
                              showF.origin.x,
                              -showF.size.height,
                              showF.size.width,
                              showF.size.height
                              );
    //创建
    window_ = [[UIWindow alloc]init];
    window_.frame = hideF;
    window_.hidden = NO;
    window_.backgroundColor = [UIColor blackColor];
    
    //button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    //设置按钮数据
    [button setTitle:text forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    
    //其他设置
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    
    if (image) {
        button.titleEdgeInsets = UIEdgeInsetsMake(0, KCTitleImageMargin, 0, 0);
        button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, KCTitleImageMargin);
    }
    //动画
    [UIView animateWithDuration:KCAnimationDuration animations:^{
        window_.frame = showF;
    }];

}
/**
 *  显示图文
 */
+(void)showText:(NSString *)text image:(UIImage *)image{
    
    //根据文字图片显示
    [self setupText:text image:image];
    
    //销毁定时器
    [timer_ invalidate];
    timer_ = nil;
    
    //定时器
    timer_ = [NSTimer scheduledTimerWithTimeInterval:KCStayDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}
/**
 *  显示文字
 */
+(void)showText:(NSString *)text{
    [self showText:text image:nil];
}

/**
 *  显示图文
 */
+(void)showText:(NSString *)text imageName:(NSString *)imageName{
    [self showText:text image:[UIImage imageNamed:imageName]];
}

/**
 *  显示成功信息
 */
+(void)showSuccuss: (NSString *)text{
    [self showText:text image:[UIImage imageNamed:@"KCStatusBarHUD.bundle/success"]];
}

/**
 *  显示失败信息
 */
+(void)showError:(NSString *)text{
    [self showText:text image:[UIImage imageNamed:@"KCStatusBarHUD.bundle/error"]];
}


/**
 *  显示正在加载信息
 */
+(void)showLoading:(NSString *)text{

    [self setupText:@"加载中" image:nil];
    
    
    UIButton *button = window_.subviews.firstObject;
    [button.titleLabel sizeToFit];
    
    //圈圈
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc]init];
    [loadingView startAnimating];
    loadingView.center = CGPointMake((window_.frame.size.width - button.titleLabel.bounds.size.width) * 0.5 - 10, window_.frame.size.height * 0.5);
    [window_ addSubview:loadingView];
    
}

/**
 *  隐藏指示器
 */
+(void)hide{
    
    // 停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    [UIView animateWithDuration:KCAnimationDuration animations:^{
        
        CGRect beginRect = window_.frame;
        beginRect.origin.y = -window_.frame.size.height;
        window_.frame = beginRect;
        
    } completion:^(BOOL finished) {
        
        //定时器为空,说明没有创建新的窗口,若不为空,说明有有,那可以不清空
        if (timer_ == nil) {
            window_ = nil;
        }
    }];
}

@end
