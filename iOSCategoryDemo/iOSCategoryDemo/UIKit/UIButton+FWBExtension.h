//
//  UIButton+FWBExtension.h
//  iOSCategoryDemo
//
//  Created by fanwenbo on 16/5/28.
//  Copyright © 2016年 fanwenbo. All rights reserved.
//

/*
 * 设置button在一定时间间隔内不能再次点击.举个例子,当你的项目运行不是很流畅的时候(通常出现在比较大的项目中),连续点击会触发多次事件,造成比如多次请求网络,多次push等.
 * button快速设置不同状态下的背景颜色(button设置背景颜色不是根据状态的哦)
 * 快速添加block代替addTarget,参考blockKit.
*/

#import <UIKit/UIKit.h>

typedef void (^TouchedBlock)(NSInteger tag);

@interface UIButton (FWBExtension)

/**
 *  Click on the button how much time interval is not responding
 */
@property (nonatomic, assign) NSTimeInterval timeInterval;


@property (nonatomic, assign) NSInteger cornerStyle;

/**
 *  With the background color of different color Settings button state (the default background color is not change with state)
 */
- (void)setBackgroundColor:(UIColor *)backgroundColor
                  forState:(UIControlState)state;

/**
 *  Add block repalce addtarget
 */
- (void)addActionHandler:(TouchedBlock)touchHandler;

@end
