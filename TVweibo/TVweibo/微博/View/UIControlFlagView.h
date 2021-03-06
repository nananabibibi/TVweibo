//
//  UIControlFlagView.h
//  TVweibo
//
//  Created by Admin on 2022/5/19.
//

#import <UIKit/UIKit.h>
 
typedef NS_ENUM(NSInteger, UIControlFlagMode) {
    FlagModelNO,
    FlagModelYES,
    FlagModelDefalt
};
 
@interface UIControlFlagView : UIControl
 
 
@property (nonatomic, strong) UIImage*noStateImg;
@property (nonatomic, strong) UIImage*yesStateImg;
@property (nonatomic, strong) UIImage*defaultStateImg;
 
@property (nonatomic, assign) UIControlFlagMode flag;
 
- (void)setFlag:(UIControlFlagMode)flag withAnimation:(BOOL)animation;
 
@end

