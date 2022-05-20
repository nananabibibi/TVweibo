//
//  OAuthViewController.h
//  TVweibo
//
//  Created by Admin on 2022/5/14.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^Myblock)(NSString *);

//@protocol passValueDelegate <NSObject>
//
//-(void)passValue:(NSString *)value;
//
//@end
extern NSString *q;

@interface OAuthViewController : UIViewController

@property(strong,nonatomic)IBOutlet WKWebView *webView;
@property(copy,nonatomic)NSString *aaa;
//@property(copy,nonatomic)void(^want)(NSString *);
//@property(weak,nonatomic)id<passValueDelegate>delegate;


- (void)webView:(WKWebView *)_webView didFinishNavigation:(null_unspecified WKNavigation *)navigation;
-(void)viewWillAppear:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
