
//
//  MyTableViewController.m
//  StoryBoardPro
//
//  Created by hundsun on 15/9/24.
//  Copyright (c) 2015年 hundsun. All rights reserved.
//

#import "MyTableViewController.h"
#import "LableCell.h"
#define CellIdentifier @"LableCell"

@interface MyTableViewController ()

@property (nonatomic, strong) NSMutableArray *dataModels;
@property (nonatomic, strong) UITableViewCell *tempCell;

@end

@implementation MyTableViewController

// 懒加载
-(NSMutableArray *)dataModels{
    // 1、判断当前数据模型是否为空
    // 2、创建数据模型，并为其赋值
    // 3、返回有值的数据模型
    if (!_dataModels) {
        _dataModels = [NSMutableArray array];
        [_dataModels addObject:@"wangxiaolong"];
        [_dataModels addObject:@"Uncomment the following line to preserve selection between presentations."];
        [_dataModels addObject:@" // Uncomment the following line to display an Edit button in the navigation bar for this view controller.self.navigationItem.rightBarButtonItem = self.editButtonItem;"];
    }
    return _dataModels;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1、设置相关视图
    [self setUPSubView];
    // 2、估算cell高度
}
- (void)setUPSubView{
    // 1、从xib创建cell
    // 2、tablview注册cell
    // 3、注意重用标示
    UINib *lableCell = [UINib nibWithNibName:CellIdentifier bundle:nil];
    [self.tableView registerNib:lableCell forCellReuseIdentifier:CellIdentifier];
    [self estimateCellHigth:self.tableView];
}
- (void)estimateCellHigth:(UITableView *)tableView{
    // 1、通过tableView的重复标示，初始化tempcell
    // 2、在代理中计算高度并且返回
    self.tempCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
}
#pragma mark -
/*
 不过在iOS7以后，提供了一个新方法可以避免这1W次调用，它就是- (CGFloat)tableView:(UITableView )tableView estimatedHeightForRowAtIndexPath:(NSIndexPath )indexPath。要求返回一个Cell的估计值，实现了这个方法，那只有显示的Cell才会触发计算高度的protocol.
 */
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70.0;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 1、将临时cell转为lablecell
    // 2、获取text
    // 3、cell高度
    // 4、返回
    LableCell *cell = (LableCell *)self.tempCell;
    cell.lableText.text = [self.dataModels objectAtIndex:indexPath.row];
    
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    
    //为何这儿要加1呢？笔者告诉你，如果不加1，结果就是错误的，Cell中UILabel将显示不正确。原因就是因为这行代码CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];由于是在cell.contentView上调用这个方法，那么返回的值将是contentView的高度，UITableViewCell的高度要比它的contentView要高1,也就是它的分隔线的高度。如果你不相信，那请看C1.xib的属性，比较下面两张图。
    
    
//[cell.contentView sizeThatFits:]]
    return height;

}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataModels.count;
}
/**这里有一个需要特别注意的问题，也是效率问题。UITableView是一次性计算完所有Cell的高度，如果有1W个Cell，那么- (CGFloat)tableView:(UITableView )tableView heightForRowAtIndexPath:(NSIndexPath )indexPath就会触发1W次，然后才显示内容。不过在iOS7以后，提供了一个新方法可以避免这1W次调用，它就是- (CGFloat)tableView:(UITableView )tableView estimatedHeightForRowAtIndexPath:(NSIndexPath )indexPath。要求返回一个Cell的估计值，实现了这个方法，那只有显示的Cell才会触发计算高度的protocol. 由于systemLayoutSizeFittingSize需要cell的一个实例才能计算，所以这儿用一个成员变量存一个Cell的实列，这样就不需要每次计算Cell高度的时候去动态生成一个Cell实例，这样即方便也高效也少用内存，可谓一举三得。
 */

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LableCell"];
    cell.lableText.text = [self.dataModels objectAtIndex:indexPath.row];
    return cell;
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

@end
