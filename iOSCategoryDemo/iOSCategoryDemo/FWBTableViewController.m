//
//  FWBTableViewController.m
//  iOSCategoryDemo
//
//  Created by fanwenbo on 16/5/28.
//  Copyright © 2016年 fanwenbo. All rights reserved.
//

#import "FWBTableViewController.h"
#import "UIColorDemoVC.h"
#import "UIButtonDemoVC.h"

#define NAVBAR_CHANGE_POINT -200

@interface FWBTableViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UIView *overlay;
@property (strong, nonatomic) NSMutableArray * dataArr;

@end

@implementation FWBTableViewController

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray arrayWithArray:@[@"UIColorCategoryDemo",
                                                    @"UIButtonCategoryDemo",
                                                    @"UIImageCategoryDemo",
                                                    @"UITextFieldCategoryDemo",
                                                    @"UILabelCategoryDemo"]];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, - 20, kSCREEN_WIDTH, 20)];
    [self.navigationController.navigationBar insertSubview:self.overlay atIndex:0];
    
    self.tableView.contentInset = UIEdgeInsetsMake(250, 0, 0, 0);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, - 250, kSCREEN_WIDTH, 250)];
    imageView.image = [UIImage imageNamed:@"lab.jpg"];
    [self.tableView addSubview:imageView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"test"];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test" forIndexPath:indexPath];
    cell.textLabel.text = self.dataArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            UIColorDemoVC * vc = [[UIColorDemoVC alloc] initWithNibName:@"UIColorDemoVC" bundle:nil];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1:
        {
            UIButtonDemoVC * vc = [[UIButtonDemoVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
    
        default:
            break;
    }
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat alpha = MIN(1, MAX(0, 1 - (offsetY + 64) / (NAVBAR_CHANGE_POINT + 64)));
    if (offsetY > NAVBAR_CHANGE_POINT) {
        self.navigationController.navigationBar.backgroundColor = [BARTINTCOLOR colorWithAlphaComponent:alpha];
        self.overlay.backgroundColor = [BARTINTCOLOR colorWithAlphaComponent:alpha];
    }else{
        self.navigationController.navigationBar.backgroundColor = [BARTINTCOLOR colorWithAlphaComponent:0];
        self.overlay.backgroundColor = [BARTINTCOLOR colorWithAlphaComponent:0];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
