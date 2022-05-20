//
//  LIstLoader.h
//  TVweibo
//
//  Created by Admin on 2022/5/13.
//

#import <Foundation/Foundation.h>

@class Information;

typedef void(^listLoaderFinishBlock)(BOOL success,NSArray<Information *> * _Nonnull dataArray);

NS_ASSUME_NONNULL_BEGIN

/*
 加载列表
 */

@interface LIstLoader : NSObject

@property(nonatomic,strong)NSString *aaa;
@property(nonatomic,strong)NSString *urlString;
-(void)loadListDataWithFinishBlock:(listLoaderFinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
