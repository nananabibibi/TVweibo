//
//  ViewController.h
//  TVweibo
//
//  Created by Admin on 2022/5/13.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>


@interface ViewController : UIViewController
@property(strong,nonatomic)IBOutlet WKWebView *webView;
@property(strong,nonatomic)NSString *access;

@end

