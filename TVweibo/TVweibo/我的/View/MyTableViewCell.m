//
//  MyTableViewCell.m
//  TVweibo
//
//  Created by Admin on 2022/5/18.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
//        [self.contentView addSubview:({
//            self.titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(20, 65, 390, 70)];
//            self.titleLabel.font=[UIFont systemFontOfSize:16];
//            self.titleLabel.textColor=[UIColor blackColor];
//            self.titleLabel.numberOfLines=3;
//            self.titleLabel;
//        })];
//        [self.contentView addSubview:({
//            self.sourceLabel=[[UILabel alloc] initWithFrame:CGRectMake(70, 25, 50, 20)];
//            self.sourceLabel.font=[UIFont systemFontOfSize:16];
//            self.sourceLabel.textColor=[UIColor grayColor];
//            self.sourceLabel;
//        })];
//        [self.contentView addSubview:({
//            self.commentLabel=[[UILabel alloc] initWithFrame:CGRectMake(200, 280, 50, 100)];
//            self.commentLabel.font=[UIFont systemFontOfSize:16];
//            self.commentLabel.textColor=[UIColor grayColor];
//            self.commentLabel;
//        })];
//        [self.contentView addSubview:({
//            self.timeLabel=[[UILabel alloc] initWithFrame:CGRectMake(255, 380, 50, 20)];
//            self.timeLabel.font=[UIFont systemFontOfSize:16];
//            self.timeLabel.textColor=[UIColor grayColor];
//            self.timeLabel;
//        })];
//        [self.contentView addSubview:({
//            self.rightImageView=[[UIImageView alloc] initWithFrame:CGRectMake(30, 250, 100, 100)];
//            self.rightImageView;
//        })];
//
//        [self.contentView addSubview:({
//            self.personimage=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
//            self.personimage;
//        })];
        
//        [self.contentView addSubview:({
//
//        })];
    }
    return self;
}


-(void)layoutTableViewCellWithItem:(Information *)information
{

    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
