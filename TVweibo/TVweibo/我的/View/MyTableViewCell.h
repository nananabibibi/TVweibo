//
//  MyTableViewCell.h
//  TVweibo
//
//  Created by Admin on 2022/5/18.
//

#import <UIKit/UIKit.h>
#import "Information.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyTableViewCell : UITableViewCell
-(void)layoutTableViewCellWithItem:(Information *)information;

@end

NS_ASSUME_NONNULL_END
