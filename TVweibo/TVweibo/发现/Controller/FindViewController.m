//
//  FindViewController.m
//  TVweibo
//
//  Created by Admin on 2022/5/13.
//

#import "FindViewController.h"
#import "SearchViewController.h"

@interface FindViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchResultsUpdating,UISearchControllerDelegate,UISearchBarDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (strong,nonatomic) NSMutableArray  *dataSource;  //原始数据

@property (nonatomic, strong) UISearchController *searchController;
@property (strong,nonatomic) NSMutableArray  *searchResults;  //搜索结果
@property (nonatomic,strong) SearchViewController *resultVC; //搜索结果展示控制器

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // self.automaticallyAdjustsScrollViewInsets = NO;
    //tableView
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
    //UISearchController
    //创建显示搜索结果控制器
    _resultVC = [[SearchViewController alloc] init];
    _searchController = [[UISearchController alloc] initWithSearchResultsController:_resultVC];
    _searchController.searchResultsUpdater = self;
    _searchController.delegate = self;

    _searchController.searchBar.placeholder = @"placeholder";
    _searchController.searchBar.showsCancelButton = YES;
    _searchController.hidesNavigationBarDuringPresentation = YES; //搜索时隐藏导航栏
    _searchController.searchBar.delegate = self;
    _searchController.searchBar.frame = CGRectMake(0, 100, 300,60);
    self.tableView.tableHeaderView = _searchController.searchBar;
    
    
    //解决：退出时搜索框依然存在的问题
    self.definesPresentationContext = YES;
}


#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 如果用户正在搜索，则返回搜索结果的count，否则直接返回数据源数组的count；
    if (self.searchController.active) {
        return self.searchResults.count;
    }else {
        return self.dataSource.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    
    // 如果用户正在搜索，则返回搜索结果对应的数据，否则直接返回数据数组对应的数据；
    if (self.searchController.active) {
        cell.textLabel.text = _searchResults[indexPath.row];
    }else {
        cell.textLabel.text = _dataSource[indexPath.row];
    }
    return cell;
}

#pragma mark UISearchResultsUpdating
// 每次更新搜索框里的文字，就会调用这个方法
// Called when the search bar's text or scope has changed or when the search bar becomes first responder.
// 根据输入的关键词及时响应：里面可以实现筛选逻辑  也显示可以联想词
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSLog(@"%s",__func__);
  
    //会自动显示新控制器的view 来展示搜索结果

    //获取搜索框里地字符串
    NSString *searchString = searchController.searchBar.text;
    
    // 谓词
    /**
     1.BEGINSWITH ： 搜索结果的字符串是以搜索框里的字符开头的
     2.ENDSWITH   ： 搜索结果的字符串是以搜索框里的字符结尾的
     3.CONTAINS   ： 搜索结果的字符串包含搜索框里的字符
     
     [c]不区分大小写[d]不区分发音符号即没有重音符号[cd]既不区分大小写，也不区分发音符号。
     
     */
    
    // 创建谓词
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS [CD] %@", searchString];
    // 如果搜索框里有文字，就按谓词的匹配结果初始化结果数组，否则，就用字体列表数组初始化结果数组。
    if (_searchResults != nil && searchString.length > 0) {
        //清除搜索结果
        [_searchResults removeAllObjects];
        _searchResults = [NSMutableArray arrayWithArray:[_dataSource filteredArrayUsingPredicate:predicate]];
    } else if (searchString.length == 0) {
        _searchResults = [NSMutableArray arrayWithArray:_dataSource];
    }
    
    //显示搜索结果
    //在新控制器调用刷新页面的方法
    self.resultVC.results = _searchResults;
    
}



// 数据源
- (NSMutableArray *) dataSource {
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray arrayWithArray:[UIFont familyNames]];
    }
    return _dataSource;
}

- (NSMutableArray *) searchResults {
    if (_searchResults == nil) {
        _searchResults = [NSMutableArray array];
    }
    return _searchResults;
}




@end
