//
//  ViewController.m
//  TVweibo
//
//  Created by Admin on 2022/5/13.
//
#import "ViewController.h"
#import "Information.h"
#import "LIstLoader.h"
#import "LoginView.h"
#import "ViewdetailController.h"
#import "NormalCellTableViewCell.h"
#import "LoginViewController.h"
#import "OAuthViewController.h"
#import "SendweiboViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,WKUIDelegate,WKNavigationDelegate>

@property(nonatomic,strong)LIstLoader *listLoader;
@property(nonatomic,strong)NSArray *dataArray;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSURL *reurl;
@property(nonatomic,strong)NSString *detailurl;
@property(nonatomic,strong)NormalCellTableViewCell *cell;
@property(nonatomic,strong)NSArray *detaildataarray;

@end

@implementation ViewController
@synthesize webView;


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSString *url = @"https://api.weibo.com/oauth2/authorize?client_id=2946042476&response_type=code&redirect_uri=https://api.weibo.com/oauth2/default.html";

    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    self.webView.navigationDelegate=self;
    self.webView.UIDelegate=self;
    [self.webView loadRequest:request];

}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"微博";
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    _tableView=[[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fabiao.png"] style:0 target:self action:@selector(sendweibo)];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"刷新" style:0 target:self action:@selector(redownloaddata)];
    
    
    [self.view addSubview:_tableView];
    
//    self.listLoader=[[LIstLoader alloc] init];
//    self.listLoader.urlString=self.access;
//    __weak typeof(self)wself = self;
//    [self.listLoader loadListDataWithFinishBlock:^(BOOL success, NSArray<Information *> * _Nonnull dataArray) {
//    __strong typeof(wself) strongSelf = wself;
//    self.dataArray=dataArray;
//    [strongSelf.tableView reloadData];
//    }];
//
    self.webView=[[WKWebView alloc]initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height-88)];
    NSString *url = @"https://api.weibo.com/oauth2/authorize?client_id=2946042476&response_type=code&redirect_uri=https://api.weibo.com/oauth2/default.html";
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    [self.webView loadRequest:request];
    
}






#pragma mark - UITableViewDelegate


//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return  6;
//}
//


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier=@"id";
    self.cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!self.cell)
    {
        self.cell=[[NormalCellTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        self.cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    [self.cell layoutTableViewCellWithItem:[self.dataArray objectAtIndex:indexPath.row]];

    //最右边多一个小箭头
    //cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;


    return self.cell;
}

//设置高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 400;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (void)webView:(WKWebView *)_webView didFinishNavigation:(null_unspecified WKNavigation *)navigation
{
    //request.URL.absoluteString;
    NSString *url = _webView.URL.absoluteString;
    NSLog(@"absoluteString:%@",url);
    
    if ([url hasPrefix:@"https://api.weibo.com/oauth2/default.html?"]) {
        
        //找到”code=“的range
        NSRange rangeOne;
        rangeOne=[url rangeOfString:@"code="];
        NSLog(@"");
        //根据他“code=”的range确定code参数的值的range
        NSRange range = NSMakeRange(rangeOne.length+rangeOne.location, url.length-(rangeOne.length+rangeOne.location));
        //获取code值
        NSString *codeString = [url substringWithRange:range];
        NSLog(@"code = :%@",codeString);
        
        
        //access token调用URL的string
        NSMutableString *muString = [[NSMutableString alloc] initWithString:@"https://api.weibo.com/oauth2/access_token?client_id=2946042476&client_secret=b463792b96bdd5ef797986ba04ed30ec&grant_type=authorization_code&redirect_uri=https://api.weibo.com/oauth2/default.html&code="];
        [muString appendString:codeString];
        NSLog(@"access token url :%@",muString);
        
        //第一步，创建URL
        NSURL *urlstring = [NSURL URLWithString:muString];
        //第二步，创建请求
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:urlstring cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
        [request setHTTPMethod:@"POST"];//设置请求方式为POST，默认为GET
        NSString *str = @"type=focus-c";//设置参数
        NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:data];
        //第三步，连接服务器
        
        // 获取默认 Session
         NSURLSession *session = [NSURLSession sharedSession];
         // 创建任务 task
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
           // 获取数据后解析并输出
            NSString *dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",dataStr);
            NSError *jsonerror;
            NSDictionary *dictionary=[NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonerror];
            NSString *_access_token = [dictionary objectForKey:@"access_token"];
            NSLog(@"access token is:%@",_access_token);
            
            
            NSMutableString *access_token_url = [[NSMutableString alloc] initWithString:@"https://api.weibo.com/2/statuses/home_timeline.json?access_token="];
            [access_token_url appendString:_access_token];
            //创建url
            NSURL *aturl=[NSURL URLWithString:access_token_url];
            NSLog(@"");
            
            
            self.reurl=aturl;
            self.access=access_token_url;
            self.listLoader=[[LIstLoader alloc] init];
            self.listLoader.urlString=self.access;
            __weak typeof(self)wself = self;
            [self.listLoader loadListDataWithFinishBlock:^(BOOL success, NSArray<Information *> * _Nonnull dataArray) {
            __strong typeof(wself) strongSelf = wself;
            self.dataArray=dataArray;
            [strongSelf.tableView reloadData];
            }];
            
            
            //创建请求
            NSMutableURLRequest *atrequest = [[NSMutableURLRequest alloc]initWithURL:aturl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
            //连接服务器
            NSURLSession *atsession=[NSURLSession sharedSession];
            NSURLSessionDataTask *attask=[atsession dataTaskWithRequest:atrequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                NSString *atdataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                NSLog(@"%@",atdataStr);
                NSError *atjsonerror;
                id atdictionary=[NSJSONSerialization JSONObjectWithData:data options:0 error:&atjsonerror];
                NSArray *dataarray= [((NSDictionary *)atdictionary) objectForKey:@"statuses"];
//                NSArray *dataarray=[((NSDictionary *)[((NSDictionary *)atdictionary) objectForKey:@"statuses"]) objectForKey:@"user"];
//                int i;
                self.detaildataarray=dataarray;
                NSLog(@"");
                NSMutableArray *listItemArray = @[].mutableCopy;
                for (NSDictionary *info in dataarray) {
                    Information *information = [[Information alloc] init];
                    [information configWithDictionary:info];
                    [listItemArray addObject:information];
                    }
                NSLog(@"");
                   [self _archiveListDataWithArray:listItemArray.copy];
//
//                    dispatch_async(dispatch_get_main_queue(), ^{
//                                   if (finishBlock) {
//                                       finishBlock(error == nil, listItemArray.copy);
//                                   }
//                               });
//                }];
            
            
            }];
            //启动任务
            [attask resume];
            
         }];
        
         // 启动任务
         [task resume];
    }
}

- (void)_archiveListDataWithArray:(NSArray<Information *> *)array{

    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];

    NSFileManager *fileManager = [NSFileManager defaultManager];

    //创建文件夹
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"GTData"];
    NSError *creatError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&creatError];

    //创建文件
    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];

    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
}

//点击后进入的画面
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    ViewdetailController*detailcontroller=[ViewdetailController new];
    //detailcontroller.articleUrl=;
    detailcontroller.view.backgroundColor=[UIColor whiteColor];
    self.cell.select=YES;
    detailcontroller.dataArray=self.detaildataarray;
    detailcontroller.detaillistLoader.urlString=self.access;
    detailcontroller.title=@"微博主页";
    [self.navigationController pushViewController:detailcontroller animated:YES];

}

//发送微博
-(void)sendweibo
{
    SendweiboViewController *vc=[[SendweiboViewController alloc] init];
    vc.view.backgroundColor=[UIColor whiteColor];
    vc.title=@"发微博";
    vc.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发送" style:0 target:self action:@selector(send)];

    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)redownloaddata
{
    [self.tableView reloadData];
    [self.tableView layoutIfNeeded];
    [self viewDidLoad];
}

-(void)send
{
    
    [self.tableView reloadData];
    [self.tableView layoutIfNeeded];
    [self viewDidLoad];
}


@end
