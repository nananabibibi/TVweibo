//
//  LoginViewController.m
//  TVweibo
//
//  Created by Admin on 2022/5/13.
//

#import "LoginViewController.h"
#import "LoginView.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view=[LoginView new];
    self.view.backgroundColor=[UIColor whiteColor];
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(100, 130, 200, 200)];
    [imageView initWithImage :[ UIImage imageNamed : @"微博.png" ]];
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(150, 340, 300, 90)];
    label.text=@"欢迎来到微博!";
    label.alpha=0.9;
    
    [self.view addSubview:imageView];
    [self.view addSubview:label];

}

@end
