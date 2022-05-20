//
//  Information.m
//  TVweibo
//
//  Created by Admin on 2022/5/13.
//

#import "Information.h"

@implementation Information

-(void)configWithDictionary:(NSDictionary *)dictionary{
    
    //self.category=[dictionary objectForKey:@"category"];
    self.picUrl=[dictionary objectForKey:@"bmiddle_pic"];
    //self.uniqueKey=[dictionary objectForKey:@"uniquekey"];
    self.title=[dictionary objectForKey:@"text"];
    self.date=[dictionary objectForKey:@"created_at"];
    self.authorName=[[dictionary objectForKey:@"user"]objectForKey:@"name"];
    self.articleUrl=[dictionary objectForKey:@"source"];
    self.comment=[dictionary objectForKey:@"comments_count"];
    self.report=[dictionary objectForKey:@"reposts_count"];
    self.attitude=[dictionary objectForKey:@"attitudes_count"];
    self.source=[dictionary objectForKey:@"source"];
    self.avatar_hd=[[dictionary objectForKey:@"user"] objectForKey:@"avatar_hd"];
    self.photo=[dictionary objectForKey:@"thumbnail_pic"];
    self.url=[[dictionary objectForKey:@"user"] objectForKey:@"url"];
    NSLog(@"");

//    self.category=[dictionary objectForKey:@"category"];
//    self.picUrl=[dictionary objectForKey:@"thumbnail_pic_s"];
//    self.uniqueKey=[dictionary objectForKey:@"uniquekey"];
//    self.title=[dictionary objectForKey:@"title"];
//    self.date=[dictionary objectForKey:@"date"];
//    self.authorName=[dictionary objectForKey:@"author_name"];
//    self.articleUrl=[dictionary objectForKey:@"url"];
}


@end
