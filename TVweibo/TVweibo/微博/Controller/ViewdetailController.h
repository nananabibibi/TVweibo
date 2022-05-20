//
//  ViewdetailController.h
//  TVweibo
//
//  Created by Admin on 2022/5/13.
//

#import <UIKit/UIKit.h>
#import "LIstLoader.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewdetailController : UITableViewController
@property (nonatomic, copy, readwrite) NSString *articleUrl;
@property(nonatomic,strong)LIstLoader *detaillistLoader;
@property(nonatomic,strong)NSArray *dataArray;

@end

NS_ASSUME_NONNULL_END
