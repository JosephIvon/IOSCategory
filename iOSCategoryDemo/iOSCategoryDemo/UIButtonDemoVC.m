//
//  UIButtonDemoVC.m
//  iOSCategoryDemo
//
//  Created by fanwenbo on 16/5/28.
//  Copyright © 2016年 fanwenbo. All rights reserved.
//

#import "UIButtonDemoVC.h"
#import "FWBFlashButton.h"
#import "UIButton+FWBExtension.h"
#import "UIView+FrameExtension.h"

@interface UIButtonDemoVC ()

@end

@implementation UIButtonDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
    [self.view addSubview:imageView];
    
    // Inner Flash Button with no text
    FWBFlashButton * innerFlashButton = [[FWBFlashButton alloc] initWithFrame:CGRectMake(100, 200, 200, 60)];
    innerFlashButton.backgroundColor = [UIColor colorWithRed:42.0f/255.0f green:62.0f/255.0f blue:80.0f alpha:1.0f];
    innerFlashButton.clickBlock = ^(void) {
        NSLog(@"Click Done");
    };
    [self.view addSubview:innerFlashButton];
    
    // Inner Flash Button with text
    FWBFlashButton *innerFlashTextButton = [[FWBFlashButton alloc] initWithFrame:CGRectMake(100, 300, 200, 60)];
    innerFlashButton.backgroundColor = [UIColor colorWithRed:153.0f/255.0f green:204.0f/255.0f blue:0 alpha:1.0f];
    innerFlashButton.flashColor = [UIColor orangeColor];
    [innerFlashButton setText:@"Hello World!" withTextColor:nil];
    [self.view addSubview:innerFlashTextButton];
    
    // Outer Round Button
    FWBFlashButton *outerRoundFlashButton = [[FWBFlashButton alloc] initWithFrame:CGRectMake(50, 84, 50, 50)];
    outerRoundFlashButton.buttonType = FWBFlashButtonTypeOuter;
    outerRoundFlashButton.layer.cornerRadius = 25;
    outerRoundFlashButton.flashColor = [UIColor colorWithRed:240/255.f green:159/255.f blue:10/255.f alpha:1];
    outerRoundFlashButton.backgroundColor = [UIColor colorWithRed:0 green:152.0f/255.0f blue:203.0f/255.0f alpha:1.0f];
    [self.view addSubview:outerRoundFlashButton];
    
    // Outer Rectangle Button
    FWBFlashButton *outerRectangleFlashButton = [[FWBFlashButton alloc] initWithFrame:CGRectMake(200, 84, 100, 60)];
    outerRectangleFlashButton.buttonType = FWBFlashButtonTypeOuter;
    [outerRectangleFlashButton setText:@"Hello World!" withTextColor:[UIColor whiteColor]];
    outerRectangleFlashButton.flashColor = [UIColor colorWithRed:248.0f/255.f green:175.0f/255.f blue:160.0f/255.f alpha:1];
    outerRectangleFlashButton.backgroundColor = [UIColor colorWithRed:0 green:152.0f/255.0f blue:203.0f/255.0f alpha:1.0f];
    [self.view addSubview:outerRectangleFlashButton];
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(100, 400, 200, 60)];
    [button setBackgroundColor:[UIColor greenColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [self.view addSubview:button];
    button.timeInterval = 1.0f;
    __weak typeof(self) weakSelf = self;
    [button addActionHandler:^(NSInteger tag) {
        NSLog(@"%ld",tag);
        [UIView animateWithDuration:0.3f animations:^{
            button.width = button.height;
            button.centerX = weakSelf.view.centerX;
        }];
    }];
    
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
