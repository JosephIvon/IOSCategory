//
//  UIButton+FWBExtension.m
//  iOSCategoryDemo
//
//  Created by fanwenbo on 16/5/28.
//  Copyright © 2016年 fanwenbo. All rights reserved.
//

#import "UIButton+FWBExtension.h"
#import <objc/runtime.h>

@interface UIButton ()
/**
 *  Is to ignore the button Touch Event
 */
@property (nonatomic, assign) BOOL isIgnoreTouch;

@end

@implementation UIButton (FWBExtension)
#pragma mark -
#pragma mark - TouchInterval
- (NSTimeInterval)timeInterval {
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}

- (void)setTimeInterval:(NSTimeInterval) timeInterval {
    objc_setAssociatedObject(self, @selector(timeInterval), @(timeInterval), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isIgnoreTouch {
    // _cmd == @selector(isIgnoreTouch)
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setIsIgnoreTouch:(BOOL)isIgnoreTouch {
    objc_setAssociatedObject(self, @selector(isIgnoreTouch), @(isIgnoreTouch), OBJC_ASSOCIATION_ASSIGN);
}

#pragma mark - Load & Swilling
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL orginSEL = @selector(sendAction:to:forEvent:);
        SEL newSEL = @selector(newSendAction:to:forEvent:);
        
        Method orginMethod = class_getInstanceMethod(self, orginSEL);
        Method newMethod = class_getInstanceMethod(self, newSEL);
        
        // The realization of the newMethod is added to the system method That is to say, Add orginMethod method Pointers into method newMethod return value indicates whether or not to add a success
        BOOL isAdd = class_addMethod(self, orginSEL, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
        
        // Add a success So at this moment does not exist in this class that newMethod methods must be newMethod orginMethod pointer into method, otherwise the newMethod method will not be implemented.
        if (isAdd) {
            class_replaceMethod(self, newSEL, method_getImplementation(orginMethod), method_getTypeEncoding(orginMethod));
        }else{
            // If add failed With the realization of the newMethod in this class, now just need to orginMethod and newMethod IMP exchange.
            method_exchangeImplementations(orginMethod, newMethod);
        }
    });
}

// When click on the button event sendAction will perform newSendAction
- (void)newSendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    
    if ([self isKindOfClass:[UIButton class]]) {
        if (!self.isIgnoreTouch) {
            self.timeInterval = self.timeInterval == 0 ? 0:self.timeInterval;
        };
        
        if (self.isIgnoreTouch) {
            return;
        }
        
        if (self.timeInterval > 0) {
            self.isIgnoreTouch = YES;
            
            // Note this is perform on the current thread using the default mode after a delay.
            [self performSelector:@selector(setIsIgnoreTouch:)
                       withObject:nil
                       afterDelay:self.timeInterval];
        }
    }
    [self newSendAction:action to:target forEvent:event];
}

#pragma mark -
#pragma mark - BackgroudColor
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    [self setBackgroundImage:[UIButton imageWithColor:backgroundColor] forState:state];
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark -
#pragma mark - Block repalce AddTarget
-(void)addActionHandler:(TouchedBlock)touchHandler {
    objc_setAssociatedObject(self, @selector(actionTouched:), touchHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(actionTouched:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)actionTouched:(UIButton *)btn {
    TouchedBlock block = objc_getAssociatedObject(self, _cmd);
    if (block) {
        block(btn.tag);
    }
}

@end
