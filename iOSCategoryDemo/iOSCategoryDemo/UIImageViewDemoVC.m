//
//  UIImageViewDemoVC.m
//  iOSCategoryDemo
//
//  Created by fanwenbo on 16/5/29.
//  Copyright © 2016年 fanwenbo. All rights reserved.
//

#import "UIImageViewDemoVC.h"
#import "UIImageView+CornerRadius.h"

@interface UIImageViewDemoVC ()

@end

@implementation UIImageViewDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView * view = [[UIView alloc] initWithFrame:kSCREEN_BOUNDS];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    UIImageView *imageView = [[UIImageView alloc] initWithRoundingRectImageView];
    [imageView setFrame:CGRectMake(130, 80, 150, 150)];
    [self.view addSubview:imageView];
    
    UIImageView *imageViewSecond = [[UIImageView alloc] initWithCornerRadiusAdvance:20.f rectCornerType:UIRectCornerBottomLeft | UIRectCornerTopRight];
    [imageViewSecond setFrame:CGRectMake(130, 280, 150, 150)];
    [self.view addSubview:imageViewSecond];
    
    
    UIImageView *imageViewThird = [[UIImageView alloc] initWithFrame:CGRectMake(130, 480, 150, 150)];
    [imageViewThird zy_cornerRadiusAdvance:20.f rectCornerType:UIRectCornerBottomRight | UIRectCornerTopLeft];
    [imageViewThird zy_attachBorderWidth:5.f color:[UIColor blackColor]];
    [self.view addSubview:imageViewThird];
    
    
#pragma mark - setImage anytime
    imageView.image = [UIImage imageNamed:@"mac_dog"];
    imageViewSecond.image = [UIImage imageNamed:@"mac_dog"];
    imageViewThird.image = [UIImage imageNamed:@"mac_dog"];
    
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
