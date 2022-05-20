//
//  GATextViewController.m
//  TVweibo
//
//  Created by Admin on 2022/5/19.
//

#import "GATextViewController.h"
 
@interface GATextViewController ()
 
@property (weak, nonatomic) IBOutlet UILabel *showLabel;
@property (strong, nonatomic) NSString *htmlString;
 
 
@end
 
@implementation GATextViewController
 
- (void)viewDidLoad {
    [super viewDidLoad];
    UILongPressGestureRecognizer *tapText = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(tapTextCopyAction:)];
    [_showLabel addGestureRecognizer:tapText];
    
    _htmlString = @"今天我不<b>回家</b><span style='color: rgb(255, 65, 6);'>吃饭</span>，你<u>自己</u>解决<i><span style='background-color: rgb(54, 37, 255);'>晚餐</span></i>，注意<sub>关掉</sub>空调。 &nbsp;";
    [self setTopicLabelWithLabel:_showLabel Text:_htmlString];
}
 

 
// 编辑
- (IBAction)tapTextLabelAction:(id)sender {
    [self enterEditTextWithContext:_htmlString];
}
 
// 进入文字编辑页面
- (void)enterEditTextWithContext:(NSString *)context {
    UIViewController *vc = [[ZSSDemoViewController alloc] init];
    __weak typeof(self) weakSelf = self;
    [vc setEditBlock:^(NSString *newContext) {
        weakSelf.htmlString = newContext;
        [self setTopicLabelWithLabel:weakSelf.showLabel Text:weakSelf.htmlString];
    }];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
 
// 设置文本
- (void)setTopicLabelWithLabel:(UILabel *)theLabel Text:(NSString *)text {
    if (!theLabel) {
        return;
    }
    if (![self judgeStringIsNull:text]) {
        text = @"";
    }
    text = [NSString stringWithFormat:@"<div style='font-size:15px;'>%@</div>",text];
    
    NSMutableAttributedString *attrStr = [theLabel.attributedText mutableCopy];
    [attrStr replaceCharactersInRange:NSMakeRange(0, attrStr.length) withString:@""];
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    // 设置行间距
    [paragraph setLineSpacing:5];
    // 设置段间距
    [paragraph setParagraphSpacingBefore:5];
    [attrStr addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0, attrStr.length)];
 
    [attrStr readFromData:[text dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    theLabel.attributedText = attrStr;
    theLabel.numberOfLines = 0;
    // 自动换行，必须设置该属性，否则需自行添加高度
    theLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 20;
}
 
// 判断字符串是否不全为空
- (BOOL)judgeStringIsNull:(NSString *)string {
    if (![[string class] isSubclassOfClass:[NSString class]]) {
        return NO;
    }
    if ([[string class] isSubclassOfClass:[NSNumber class]]) {
        return YES;
    }
    BOOL result = NO;
    if (string != nil && string.length > 0) {
        for (int i = 0; i < string.length; i ++) {
            NSString *subStr = [string substringWithRange:NSMakeRange(i, 1)];
            if (![subStr isEqualToString:@" "] && ![subStr isEqualToString:@""]) {
                result = YES;
            }
        }
    }
    return result;
}
 
@end
