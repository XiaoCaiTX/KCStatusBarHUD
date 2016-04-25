//
//  KCStatusbarHUD.h
//  KCStatusBarHUD
//
//  Created by Kevin on 16/4/25.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KCStatusbarHUD : NSObject

/**
 *  显示文字
 */
+(void)showText:(NSString *)text;
/**
 *  显示图文
 */
+(void)showText:(NSString *)text image:(UIImage *)image;
/**
 *  显示图文
 */
+(void)showText:(NSString *)text imageName:(NSString *)imageName;

/**
 *  显示成功信息
 */
+(void)showSuccuss: (NSString *)text;

/**
 *  显示失败信息
 */
+(void)showError:(NSString *)text;

/**
 *  显示正在加载信息
 */
+(void)showLoading:(NSString *)text;

/**
 *  隐藏指示器
 */
+(void)hide;
@end

