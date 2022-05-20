//
//  OAuthViewController.m
//  TVweibo
//
//  Created by Admin on 2022/5/14.
//

#import "OAuthViewController.h"
#import<WebKit/WebKit.h>
#import"Information.h"
#import "LIstLoader.h"

NSString *q;

@interface OAuthViewController ()<WKUIDelegate,WKNavigationDelegate>


@end

@implementation OAuthViewController
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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:({
        self.webView=[[WKWebView alloc]initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height-88)];
        NSString *url = @"    https://api.weibo.com/oauth2/authorize?client_id=2946042476&redirect_uri=https://api.weibo.com/oauth2/default.html&response_type=code&display=mobile";

        //https://api.weibo.com/oauth2/authorize?client_id=4004023350&response_type=code&redirect_uri=https://api.weibo.com/oauth2/default.html
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
        [self.webView loadRequest:request];
        self.webView;

    })];

    

}



- (void)webView:(WKWebView *)_webView didFinishNavigation:(null_unspecified WKNavigation *)navigation
{
    //request.URL.absoluteString;
    NSString *url = _webView.URL.absoluteString;
    NSLog(@"absoluteString:%@",url);
    
    
    NSMutableString *access_token_url = [[NSMutableString alloc] initWithString:@"https://api.weibo.com/2/statuses/home_timeline.json?access_token="];

    
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
            
            
            //NSMutableString *access_token_url = [[NSMutableString alloc] initWithString:@"https://api.weibo.com/2/statuses/home_timeline.json?access_token="];
            [access_token_url appendString:_access_token];
            //创建url
            NSURL *aturl=[NSURL URLWithString:access_token_url];
            
//            AppDelegate *delegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
//            delegate.aa=access_token_url;
//            NSLog(@"");
//            AppDelegate *delegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
//            delegate.aa=access_token_url;
            
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

            }];
            //启动任务
            [attask resume];
            
         }];
        
         // 启动任务
         [task resume];
             
        
        
    }

}

    


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//
//#pragma mark -WkWebView Delegate Methods
//

@end
