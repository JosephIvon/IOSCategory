//
//  UIButton+FWBExtension.h
//  iOSCategoryDemo
//
//  Created by fanwenbo on 16/5/28.
//  Copyright © 2016年 fanwenbo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TouchedBlock)(NSInteger tag);

typedef NS_ENUM(NSUInteger,FWBFlashButtonType) {
    FWBFlashButtonTypeInner = 0,
    FWBFlashButtonTypeOuter = 1
};

@interface UIButton (FWBExtension)

/**
 *  Click on the button how much time interval is not responding
 */
@property (nonatomic, assign) NSTimeInterval timeInterval;

/**
 *  Part of the removal of button
 */
@property (nonatomic, assign) FWBFlashButtonType buttonType;

/**
 *  the flashColor of button
 */
@property (nonatomic, strong) UIColor *flashColor;

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
