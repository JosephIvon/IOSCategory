//
//  UIColorDemoVC.m
//  iOSCategoryDemo
//
//  Created by fanwenbo on 16/5/28.
//  Copyright © 2016年 fanwenbo. All rights reserved.
//

#import "UIColorDemoVC.h"
#import "UIColor+DYKAddition.h"

@interface UIColorDemoVC () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UIView *view3;

@end

@implementation UIColorDemoVC

- (IBAction)tapAction:(id)sender {
    self.view2.backgroundColor = RGBA(arc4random()%255, arc4random()%255, arc4random()%255, 1);
    self.label2.text = [UIColor hexValuesFromUIColor:self.view2.backgroundColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

//按下Done键关闭键盘
- (IBAction)textFieldDoneEditing:(id)sender {
    UITextField * textfield = (UITextField *)sender;
    [textfield resignFirstResponder];
        if (textfield.tag == 1000) {
        self.view1.backgroundColor = [UIColor colorWithHexString:self.textField1.text];
    }
    else if (textfield.tag == 1001){
        self.view3.backgroundColor = [UIColor colorWithHexRGB:[self.textField2.text floatValue]];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
