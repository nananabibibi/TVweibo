//
//  NormalCellTableViewCell.m
//  TVweibo
//
//  Created by Admin on 2022/5/13.
//

#import "NormalCellTableViewCell.h"
#import "Information.h"
#import "UIControlFlagView.h"
#import "MessageViewController.h"
@interface NormalCellTableViewCell()

@property(nonatomic,strong,readwrite)UILabel*titleLabel;
@property(nonatomic,strong,readwrite)UILabel*sourceLabel;
@property(nonatomic,strong,readwrite)UILabel*commentLabel;
@property(nonatomic,strong,readwrite)UILabel*timeLabel;
@property(nonatomic,strong,readwrite)UIImageView*rightImageView;
@property(nonatomic,strong,readwrite)UIButton*deleteButton;
@property(nonatomic,strong,readwrite)UIImageView*personimage;
@property(nonatomic,strong,readwrite)UIImageView *picture;
@property(nonatomic,strong,readwrite)UILabel *ceshi;
@property(nonatomic,strong,readwrite)UIControlFlagView *collection;
@property(nonatomic,strong,readwrite)UIButton *colletbutton;


@end
@implementation NormalCellTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self.contentView addSubview:({
            self.titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(20, 65, 390, 70)];
            self.titleLabel.font=[UIFont systemFontOfSize:16];
            self.titleLabel.textColor=[UIColor blackColor];
            self.titleLabel.numberOfLines=3;
            self.titleLabel;
        })];
        [self.contentView addSubview:({
            self.sourceLabel=[[UILabel alloc] initWithFrame:CGRectMake(70, 25, 50, 20)];
            self.sourceLabel.font=[UIFont systemFontOfSize:16];
            self.sourceLabel.textColor=[UIColor grayColor];
            self.sourceLabel;
        })];
        [self.contentView addSubview:({
            self.commentLabel=[[UILabel alloc] initWithFrame:CGRectMake(200, 280, 50, 100)];
            self.commentLabel.font=[UIFont systemFontOfSize:16];
            self.commentLabel.textColor=[UIColor grayColor];
            self.commentLabel;
        })];
        [self.contentView addSubview:({
            self.timeLabel=[[UILabel alloc] initWithFrame:CGRectMake(265, 380, 50, 20)];
            self.timeLabel.font=[UIFont systemFontOfSize:16];
            self.timeLabel.textColor=[UIColor grayColor];
            self.timeLabel;
        })];
        [self.contentView addSubview:({
            self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 250, 100, 100)];
            self.rightImageView.contentMode = UIViewContentModeScaleAspectFit;
            self.rightImageView;
        })];
        
        [self.contentView addSubview:({
            self.personimage=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
            self.personimage;
        })];
        
        [self.contentView addSubview:({
            self.ceshi=[[UILabel alloc] initWithFrame:CGRectMake(1, 250, 450, 100)];
            self.ceshi.font=[UIFont systemFontOfSize:16];
            self.ceshi.textColor=[UIColor grayColor];
            self.ceshi;
        })];
        
        [self.contentView addSubview:({
            self.picture=[[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 50, 50)];
            self.picture;
        })];
        
//        //收藏按钮
//        [self.contentView addSubview:({
//            self.colletbutton=[[UIButton alloc] initWithFrame:CGRectMake(280, 200, 40, 40)];
//            self.colletbutton.imageView.image=[UIImage imageNamed:@"shoucang.png"];
//            self.colletbutton;
//        })];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutTableViewCellWithItem:(Information *)information
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        
        self.titleLabel.text=information.title;
        [self.titleLabel sizeToFit];
        self.sourceLabel.text=information.authorName;
        [self.sourceLabel sizeToFit];
    //    self.commentLabel.text=information.comment;
    //    [self.commentLabel sizeToFit];
        self.timeLabel.text=information.date;
        [self.timeLabel sizeToFit];
        self.personimage.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:information.avatar_hd]]];
        NSLog(@"");
        self.ceshi.text=information.picUrl;
        self.rightImageView.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:information.picUrl]]];
        
    });

    self.picture.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:(NSString *)information.photo]]];

}




@end
