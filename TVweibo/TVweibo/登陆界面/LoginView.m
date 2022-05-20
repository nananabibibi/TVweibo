//
//  LoginView.m
//  TVweibo
//
//  Created by Admin on 2022/5/13.
//

#define textFieldColor(r, g, b) [UIColor colorWithRed:r/ 255.0f green:g/ 255.0f blue:b/ 255.0f alpha: 1 ]
#define mianBodyColor(r, g, b) [UIColor colorWithRed:r/ 255.0f green:g/ 255.0f blue:b/ 255.0f alpha: 1 ]
#import "LoginView.h"
#import "BasicTextField.h"
#import "LoginBackgroundView.h"

@interface LoginView ()< UITextFieldDelegate >

@property ( nonatomic , strong ) LoginBackgroundView *backgroundView;
@property ( nonatomic , strong ) BasicTextField *userTextField;
@property ( nonatomic , strong ) BasicTextField *passwordTextField;
@property ( nonatomic , strong ) UIButton *loginButton;
@property ( nonatomic , strong ) UIActivityIndicatorView *logioningActivityIndicatorView;
@property ( nonatomic , assign ) BOOL isUserEmpty;
@property ( nonatomic , assign ) BOOL isPasswordEmpty;
@end


@implementation LoginView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame :frame];
    if (self) {
        [self addLoginBackgroundView :frame];
        [self customAllButtons :frame];
        [self customUserTextField :self.backgroundView.frame];
        [self customPasswordTextField :self.backgroundView.frame];
    }
    return self ;
}
//添加textField的背景View
- ( void )addLoginBackgroundView:( CGRect )frame{
    self.backgroundView = [[ LoginBackgroundView alloc ] initWithFrame : CGRectMake (32, 420, 350, 80)];
    [self.backgroundView setBackgroundColor :[ UIColor whiteColor ]];
    [self.backgroundView.layer setCornerRadius : 5.0 ];
    [self.backgroundView.layer setBorderWidth : 1.0 ];
    [self.backgroundView.layer setBorderColor : textFieldColor (207,207,207).CGColor ];
    [self addSubview : self.backgroundView];
}

- ( void )customAllButtons:( CGRect )frame{
    // 返回 button
//    UIButton *backButton = [[ UIButton alloc ] initWithFrame : CGRectMake (150,460,90,40)];
//    [backButton setBackgroundImage :[ UIImage imageNamed : @"back" ] forState : UIControlStateNormal ];
//    [backButton addTarget : self action : @selector (clickTheBackButton:) forControlEvents : UIControlEventTouchDown ];
//    [ self addSubview :backButton];
    // 登录 button
    self.loginButton = [[ UIButton alloc ] initWithFrame : CGRectMake (150, 560, 90, 40 )];
    [self.loginButton setEnabled : NO ];
    self.loginButton.titleLabel . alpha = 0.5 ;
    [self.loginButton.layer setCornerRadius : 3.0];
    [self.loginButton setTitle : @" 登录 " forState : UIControlStateNormal];
    [self.loginButton setTitleColor :[ UIColor whiteColor ] forState : UIControlStateReserved];
    [self.loginButton setBackgroundColor : mianBodyColor ( 133 , 122 , 250 )];
    [self.loginButton addTarget : self action : @selector (clickLoginButton:) forControlEvents : UIControlEventTouchDown];
    [self addSubview : self . loginButton ];
    // 忘记密码
    UIButton *forgetButton = [[ UIButton alloc ] initWithFrame : CGRectMake (310, 570, 80, 30)];
    [forgetButton addTarget : self action: @selector (clickForgetpasswordTextFieldButton:) forControlEvents : UIControlEventTouchDown ];
    [forgetButton setTitle : @" 忘记密码 ?" forState : UIControlStateNormal];
    [forgetButton. titleLabel setFont :[ UIFont systemFontOfSize : 14 ]];
    [forgetButton setTitleColor : textFieldColor ( 74 , 74 , 74 ) forState : UIControlStateNormal];
    [ self addSubview :forgetButton];
}

- ( void )customUserTextField:( CGRect )frame{
    self . userTextField = [[ BasicTextField alloc ] initWithFrame : CGRectMake (0,0,frame.size.width,40)];
    self . userTextField.keyboardType = UIKeyboardTypeNumberPad ;
    self . userTextField.delegate = self ;
    self . userTextField.tag = 7 ;
    self . userTextField.placeholder = @" 请输入账号 " ;
    [ self . userTextField setFont :[ UIFont systemFontOfSize : 14 ]];
    UIImageView *userTextFieldImage = [[ UIImageView alloc ] initWithImage :[ UIImage imageNamed : @"zhanghao" ]];
//    userTextFieldImage.frame=CGRectMake(100, 100, 100, 100);
    self . userTextField.leftView = userTextFieldImage;
    self . userTextField.leftViewMode = UITextFieldViewModeAlways ;
    self . userTextField.clearButtonMode = UITextFieldViewModeAlways ;
    [[ NSNotificationCenter defaultCenter] addObserver : self selector : @selector (userTextFieldDidChange) name : UITextFieldTextDidChangeNotification object : self . userTextField ];
    self . isPasswordEmpty = YES ;
    [ self . backgroundView addSubview : self.userTextField];
}

- ( void )customPasswordTextField:( CGRect )frame{
    self.passwordTextField = [[ BasicTextField alloc ] initWithFrame : CGRectMake ( 0 , 40 , frame. size . width , 40 )];
    self.passwordTextField.delegate = self ;
    self.passwordTextField.tag = 11 ;
    self.passwordTextField.placeholder = @" 请输入密码 " ;
    [self.passwordTextField setFont :[ UIFont systemFontOfSize : 14 ]];
    UIImageView *passwordTextFieldImage = [[ UIImageView alloc ] initWithImage :[ UIImage imageNamed : @" mima" ]];
//    passwordTextFieldImage.frame=CGRectMake(100, 100, 100, 100);
    self.passwordTextField.leftView = passwordTextFieldImage;
    self.passwordTextField.leftViewMode = UITextFieldViewModeAlways ;
    self.passwordTextField.clearButtonMode = UITextFieldViewModeAlways ;
    self.passwordTextField.secureTextEntry = YES;
//设置监听
    [[ NSNotificationCenter defaultCenter ] addObserver : self selector : @selector (passwordTextFieldDidChange) name : UITextFieldTextDidChangeNotification object : self.passwordTextField ];
    self . isUserEmpty = YES ;
    [self.backgroundView addSubview : self.passwordTextField ];
}

- ( void )addLogioningActivityIndicatorView{
    CGFloat logioningActivityIndicatorViewX = self . loginButton . frame . origin . x + 80 ;
    CGFloat logioningActivityIndicatorViewY = self . loginButton . frame . origin . y ;
    CGFloat logioningActivityIndicatorViewWH = self . loginButton . frame . size . height ;
    self.logioningActivityIndicatorView = [[ UIActivityIndicatorView alloc] initWithFrame : CGRectMake (logioningActivityIndicatorViewX, logioningActivityIndicatorViewY, logioningActivityIndicatorViewWH, logioningActivityIndicatorViewWH)];
    [self addSubview : self.logioningActivityIndicatorView ];
}

- (void)clickLoginButton:(id)sender{
    [self.loginButton setTitle : @" 登录中 ..." forState : UIControlStateNormal];
    [self addLogioningActivityIndicatorView];
    [self.logioningActivityIndicatorView startAnimating];
//当点击登录按钮时，账号和密码输入框放弃第一响应者，此时键盘退出
    [self.userTextField resignFirstResponder ];
    [self.passwordTextField resignFirstResponder ];
    
}

- (void)clickForgetpasswordTextFieldButton:(id)sender{
   //点击忘记密码button后需要执行的代码
    
}

- (void)clickTheBackButton:(id)sender{
  //点击左上角圈叉按钮返回上一界面
}

#pragma makr --UITextFieldDelegate
//UITextField的代理方法，点击键盘return按钮退出键盘
- ( BOOL )textFieldShouldReturn:( UITextField *)textField{
    [ self . passwordTextField resignFirstResponder ];
    return YES ;
}
//此处为userTextField的监听方法，后面会细讲，主要是实时监听textField值的变化
- ( void )userTextFieldDidChange{
    if ( self . userTextField . text . length > 0 ) {
        UIImageView *loginTextFieldImage = [[ UIImageView alloc ] initWithImage :[ UIImage imageNamed : @"userIconEdited" ]];
        self.userTextField . leftView = loginTextFieldImage;
        self.isUserEmpty = NO ;
        if ( self.isPasswordEmpty == NO ) {
            self.loginButton . titleLabel . alpha = 1 ;
            [self.loginButton setEnabled : YES ];
        }
    } else {
        UIImageView *loginTextFieldImage = [[ UIImageView alloc ] initWithImage :[ UIImage imageNamed : @"userIcon" ]];
        self . userTextField . leftView = loginTextFieldImage;
        [self.loginButton setTitle : @" 登录 " forState : UIControlStateNormal ];
        self.loginButton.titleLabel.alpha = 0.5 ;
        [self.loginButton setEnabled : NO ];
        self.isUserEmpty = YES ;
        [self.logioningActivityIndicatorView stopAnimating ];
    }
}
//passwordTextField的监听方法
- ( void )passwordTextFieldDidChange{
     if ( self . passwordTextField . text . length > 0 ) {
         self . isPasswordEmpty = NO ;
          UIImageView *loginTextFieldImage = [[ UIImageView alloc ] initWithImage :[ UIImage imageNamed : @"passwordIconEdited" ]];
         self . passwordTextField . leftView = loginTextFieldImage;
         if ( self . isUserEmpty == NO ){
             self . loginButton . titleLabel . alpha = 1 ;
             [ self . loginButton setEnabled : YES ];
         }
      } else {
          self . isPasswordEmpty = YES ;
          UIImageView *loginTextFieldImage = [[ UIImageView alloc ] initWithImage :[ UIImage imageNamed : @"passwordIcon" ]];
        self . passwordTextField . leftView = loginTextFieldImage;
        [ self . loginButton setTitle : @" 登录 " forState : UIControlStateNormal ];
        self . loginButton . titleLabel . alpha = 0.5 ;
        [ self . loginButton setEnabled : NO ];
        [ self . logioningActivityIndicatorView stopAnimating ];
    }
}
//点击界面空白处退出键盘
- ( void )touchesBegan:( NSSet < UITouch *> *)touches withEvent:( UIEvent *)event{
    [ self . userTextField resignFirstResponder ];
    [ self . passwordTextField resignFirstResponder ];
}

@end
