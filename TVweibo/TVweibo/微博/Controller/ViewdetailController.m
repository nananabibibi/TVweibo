//
//  ViewdetailController.m
//  TVweibo
//
//  Created by Admin on 2022/5/13.
//



#import "ViewdetailController.h"
#import <WebKit/WebKit.h>
#import "Information.h"

@interface ViewdetailController ()<WKNavigationDelegate>
@property(nonatomic,strong,readwrite)WKWebView *webView;
@property(nonatomic,strong,readwrite)UIProgressView *progressview;


@end

@implementation ViewdetailController


-(void)dealloc
{
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
             
        [self.view addSubview:({
            
            self.webView=[[WKWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
            self.webView.navigationDelegate=self;
            
            //self.articleUrl
//            [self.detaillistLoader loadListDataWithFinishBlock:^(BOOL success, NSArray<Information *> * _Nonnull dataArray)
//            {
//                self.dataArray=dataArray;
//                NSLog(@"");
//            }];
            NSMutableArray *listItemArray = @[].mutableCopy;
            Information *information = [[Information alloc] init];
            for (NSDictionary *info in self.dataArray) {
                [information configWithDictionary:info];
                [listItemArray addObject:information];
                }
            NSString * url= information.url;
            NSLog(@"");
            
            //https://weibo.com/u/7480379902/home?wvr=5
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://weibo.com/u/7480379902/home?wvr=5"]]];
            [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
            self.webView;
        })];
        
        [self.view addSubview:({
            self.progressview=[[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
            self.progressview;
            
        })];
        
        

           });
    
    
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    self.progressview.progress=self.webView.estimatedProgress;
    
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
