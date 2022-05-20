//
//  MyViewController.m
//  TVweibo
//
//  Created by Admin on 2022/5/13.
//

#import "MyViewController.h"
#import "Information.h"
#import "LoginViewController.h"
#import "Login.h"
#import "ViewController.h"
#import "Information.h"
#import "LIstLoader.h"
#import "LoginView.h"
#import "ViewdetailController.h"
#import "NormalCellTableViewCell.h"
#import "LoginViewController.h"
#import "OAuthViewController.h"
#import "MyTableViewCell.h"
#import "MydetailViewController.h"

@interface MyViewController ()<UITableViewDelegate,UITableViewDataSource,WKUIDelegate,WKNavigationDelegate>
@property (nonatomic, strong, readwrite) UITableView *tableView;
@property (nonatomic, strong, readwrite) UIView *tableViewHeaderView;
@property (nonatomic, strong, readwrite) UIImageView *headerImageView;
@property(nonatomic,strong)LIstLoader *listLoader;
@property(nonatomic,strong)NSArray *dataArray;
@property(nonatomic,strong)NSURL *reurl;
@property(nonatomic)NSString *myname;
@end

@implementation MyViewController
@synthesize webView;


- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    _tableView=[[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    
    [self.view addSubview:_tableView];
    
//    self.webView=[[WKWebView alloc]initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height-88)];
//    NSString *url = @"https://api.weibo.com/oauth2/authorize?client_id=1313382226&response_type=code&redirect_uri=https://api.weibo.com/oauth2/default.html";
//    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
//    [self.webView loadRequest:request];
    
}

#pragma mark -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{


    //最右边多一个小箭头
    //cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mineTableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mineTableViewCell"];
    }
    return cell;
    
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (!_tableViewHeaderView) {

        _tableViewHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
        _tableViewHeaderView.backgroundColor = [UIColor whiteColor];

        [_tableViewHeaderView addSubview:({
            _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, 140)];
            _headerImageView.backgroundColor = [UIColor whiteColor];
            //_headerImageView.image=[UIImage imageNamed:@"sousuo"];
            _headerImageView.contentMode = UIViewContentModeScaleAspectFit;
            _headerImageView.clipsToBounds = YES;
            _headerImageView.userInteractionEnabled = YES;
            _headerImageView;
        })];

        [_tableViewHeaderView addGestureRecognizer:({
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapImage)];
            tapGesture;
        })];
    }

    return _tableViewHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 200;
}

//- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
//    if (![[Login sharedLogin] isLogin]) {
//        [_headerImageView setImage:[UIImage imageNamed:@"icon.bundle/icon.png"]];
//    }else{
//       [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:[Login sharedLogin].avatarUrl]];
//    }
//}
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    [_headerImageView setImage:[UIImage imageNamed:@"headpicture.JPG"]];
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0){
        cell.textLabel.text=@"收藏";
    }

}


#pragma mark - UITableViewDelegate




//点击后进入的画面

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    MydetailViewController*detailcontroller=[[MydetailViewController alloc] init];
    detailcontroller.view.backgroundColor=[UIColor whiteColor];
    detailcontroller.title=@"收藏";
    [self.navigationController pushViewController:detailcontroller animated:YES];

}




@end
