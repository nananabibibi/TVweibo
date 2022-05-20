//
//  Information.h
//  TVweibo
//
//  Created by Admin on 2022/5/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Information : NSObject


@property(nonatomic,copy,readwrite)NSString *category;
@property(nonatomic,copy,readwrite)NSString *picUrl;//图片
@property(nonatomic,copy,readwrite)NSString *uniqueKey;
@property(nonatomic,copy,readwrite)NSString *title;//内容
@property(nonatomic,copy,readwrite)NSString *date;//时间
@property(nonatomic,copy,readwrite)NSString *authorName;//作者名字
@property(nonatomic,copy,readwrite)NSString *articleUrl;//来源
@property(nonatomic,copy,readwrite)NSString *comment;//评论
@property(nonatomic,copy,readwrite)NSString *report;//转发
@property(nonatomic,copy,readwrite)NSString *attitude;//点赞
@property(nonatomic,copy,readwrite)NSString *source;//来源
@property(nonatomic,copy,readwrite)NSString *avatar_hd;//头像
@property(nonatomic,copy,readwrite)NSString *photo;
@property(nonatomic,copy,readwrite)NSString *url;//主页

-(void)configWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
