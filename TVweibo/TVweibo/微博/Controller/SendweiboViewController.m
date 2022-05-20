//
//  SendweiboViewController.m
//  TVweibo
//
//  Created by Admin on 2022/5/19.
//

#import "SendweiboViewController.h"

@interface SendweiboViewController ()<UITextFieldDelegate,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UITextField *textField;
@property(nonatomic,strong)NSString *data;

@end

@implementation SendweiboViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView=[[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.delegate=self;
    [self.view addSubview:self.tableView];
        
    self.textField=[[UITextField alloc] initWithFrame:CGRectMake(30, 20, 360, 200)];
    self.textField.delegate=self;
    self.textField.placeholder=@"分享生活，留住感动";
    [self.tableView addSubview:self.textField];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
