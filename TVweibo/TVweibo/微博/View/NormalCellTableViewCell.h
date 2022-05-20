//
//  NormalCellTableViewCell.h
//  TVweibo
//
//  Created by Admin on 2022/5/13.
//

#import <UIKit/UIKit.h>

@class Information;
NS_ASSUME_NONNULL_BEGIN

@interface NormalCellTableViewCell : UITableViewCell
@property(nonatomic)BOOL select;

-(void)layoutTableViewCellWithItem:(Information *)information;

@end

NS_ASSUME_NONNULL_END

