//
//  Login.h
//  TVweibo
//
//  Created by Admin on 2022/5/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^GTLoginFinishBlock)(BOOL isLogin);

/**
 QQ登录和分享相关逻辑
 */
@interface Login : NSObject

@property(nonatomic, strong, readonly)NSString *nick;
@property(nonatomic, strong, readonly)NSString *address;
@property(nonatomic, strong, readonly)NSString *avatarUrl;

+ (instancetype)sharedLogin;

#pragma - mark - 登录

- (BOOL)isLogin;
- (void)loginWithFinishBlock:(GTLoginFinishBlock)finishBlock;
- (void)logOut;

#pragma mark - 分享
- (void)shareToQQWithArticleUrl:(NSURL *)articleUrl;

@end

NS_ASSUME_NONNULL_END
