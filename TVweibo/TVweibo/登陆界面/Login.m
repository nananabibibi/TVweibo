//
//  Login.m
//  TVweibo
//
//  Created by Admin on 2022/5/13.
//

#import "Login.h"

@interface Login ()
@property (nonatomic, copy, readwrite) GTLoginFinishBlock finishBlock;
@property (nonatomic, assign, readwrite) BOOL isLogin;
@end

@implementation Login

+ (instancetype)sharedLogin {
    static Login *login;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        login = [[Login alloc] init];
    });
    return login;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _isLogin = NO;
    }
    return self;
}

- (BOOL)isLogin {
    //登陆态失效的逻辑
    return _isLogin;
}

- (void)loginWithFinishBlock:(GTLoginFinishBlock)finishBlock {
    
    _finishBlock = [finishBlock copy];
    

}





@end
