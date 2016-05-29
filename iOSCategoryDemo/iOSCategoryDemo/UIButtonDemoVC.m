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
#import "FWBBubbleMenuButton.h"

@interface UIButtonDemoVC ()

@end

@implementation UIButtonDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
    [self.view addSubview:imageView];
    
    [self showBubbleMenuButton];
    
    [self showFlashButtons];
    
    [self ShowButtonCategoryInfluence];
}

-(void)showBubbleMenuButton{
    UILabel *homeLabel = [self createHomeButtonView];
    
    FWBBubbleMenuButton *downMenuButton = [[FWBBubbleMenuButton alloc] initWithFrame:CGRectMake(20.f,20.f,homeLabel.frame.size.width,homeLabel.frame.size.height)
                                                                expansionDirection:DirectionDown];
    downMenuButton.homeButtonView = homeLabel;
    
    [downMenuButton addButtons:[self createDemoButtonArray]];
    
    [self.view addSubview:downMenuButton];
    
    
    // Create up menu button
    homeLabel = [self createHomeButtonView];
    
    FWBBubbleMenuButton *upMenuView = [[FWBBubbleMenuButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - homeLabel.frame.size.width - 20.f,
                                                                                          self.view.frame.size.height - homeLabel.frame.size.height - 20.f,
                                                                                          homeLabel.frame.size.width,
                                                                                          homeLabel.frame.size.height)
                                                            expansionDirection:DirectionUp];
    upMenuView.homeButtonView = homeLabel;
    
    [upMenuView addButtons:[self createDemoButtonArray]];
    
    [self.view addSubview:upMenuView];
}

- (UILabel *)createHomeButtonView {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.f, 0.f, 40.f, 40.f)];
    
    label.text = @"Tap";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.layer.cornerRadius = label.frame.size.height / 2.f;
    label.backgroundColor =[UIColor colorWithRed:0.f green:0.f blue:0.f alpha:0.5f];
    label.clipsToBounds = YES;
    
    return label;
}

- (UIButton *)createButtonWithName:(NSString *)imageName {
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button sizeToFit];
    
    [button addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

- (NSArray *)createDemoButtonArray {
    NSMutableArray *buttonsMutable = [[NSMutableArray alloc] init];
    int i = 0;
    for (NSString *title in @[@"A", @"B", @"C", @"D", @"E", @"F"]) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitle:title forState:UIControlStateNormal];
        
        button.frame = CGRectMake(0.f, 0.f, 30.f, 30.f);
        button.layer.cornerRadius = button.frame.size.height / 2.f;
        button.backgroundColor = [UIColor colorWithRed:0.f green:0.f blue:0.f alpha:0.5f];
        button.clipsToBounds = YES;
        button.tag = i++;
        
        [button addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
        
        [buttonsMutable addObject:button];
    }
    return [buttonsMutable copy];
}

- (void)test:(UIButton *)sender {
    NSLog(@"Button tapped, tag: %ld", (long)sender.tag);
}

-(void)ShowButtonCategoryInfluence{
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(100, 400, 200, 60)];
    [button setBackgroundColor:[UIColor greenColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [self.view addSubview:button];
    button.timeInterval = 1.0f;
    __weak typeof(self) weakSelf = self;
    __weak typeof(button) weakButton = button;
    [button addActionHandler:^(NSInteger tag) {
        [UIView animateWithDuration:0.3f animations:^{
            weakButton.width = weakButton.height;
            weakButton.centerX = weakSelf.view.centerX;
        }];
        [weakButton bezierPathWithRoundedRect:weakButton.bounds byRoundingCorners:UICornerStyleBottomLeftAndTopRight cornerRadii:CGSizeMake(10, 10)];
    }];
}

-(void)showFlashButtons{
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
    FWBFlashButton *outerRoundFlashButton = [[FWBFlashButton alloc] initWithFrame:CGRectMake(100, 84, 50, 50)];
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

}

-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
}

- (BOOL)prefersStatusBarHidden {
    return true;
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
