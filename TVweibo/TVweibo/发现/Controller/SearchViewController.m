//
//  SearchViewController.m
//  TVweibo
//
//  Created by Admin on 2022/5/13.
//

#import "SearchViewController.h"

@interface SearchViewController ()


@property(nonatomic,strong)UITableView *tableView;


@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];


}

//在新控制器里：
//在获得搜索结果数据时，调用刷新页面的方法

-(void)setResults:(NSArray *)results {
    NSLog(@"%s",__FUNCTION__);
    _results = results;
    [self.tableView reloadData];
}

@end
