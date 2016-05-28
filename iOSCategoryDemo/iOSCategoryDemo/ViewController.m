//
//  ViewController.m
//  iOSCategoryDemo
//
//  Created by fanwenbo on 16/5/28.
//  Copyright © 2016年 fanwenbo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) NSMutableArray * dataArr;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray arrayWithArray:@[@"UIColorCategoryDemo",@"UIImageCategoryDemo",@"UIViewCategoryDemo",@"UIButtonCategoryDemo"]];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor redColor];
}

#pragma mark -- uitableview Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * reuserID = @"test";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:reuserID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuserID];
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
