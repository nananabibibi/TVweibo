//
//  LIstLoader.m
//  TVweibo
//
//  Created by Admin on 2022/5/13.
//

#import "ListLoader.h"
#import "Information.h"
#import "OAuthViewController.h"
#import "AppDelegate.h"

@implementation LIstLoader




-(void)loadListDataWithFinishBlock:(listLoaderFinishBlock)finishBlock
{

    
    
        NSURL *listURL = [NSURL URLWithString:self.urlString];
    NSURLSession *session = [NSURLSession sharedSession];

    __weak typeof(self) weakSelf = self;
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
                                          NSError *jsonError;
                                          id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

//注意类型的检查
        
        NSArray *dataArray= [((NSDictionary *)jsonObj) objectForKey:@"statuses"];

        NSLog(@"");
                                          NSMutableArray *listItemArray = @[].mutableCopy;
                                          for (NSDictionary *info in dataArray) {
                                              Information *information = [[Information alloc] init];
                                              [information configWithDictionary:info];
                                              [listItemArray addObject:information];
                                              }
            
                                             [strongSelf _archiveListDataWithArray:listItemArray.copy];

                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                             if (finishBlock) {
                                                                 finishBlock(error == nil, listItemArray.copy);
                                                             }
                                                         });
                                          }];

        [dataTask resume];
    }

//#pragma mark - private method
//
//- (NSArray<Information *> *)_readDataFromLocal{
//
//    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
//    NSString *cachePath = [pathArray firstObject];
//    NSString *listDataPath = [cachePath stringByAppendingPathComponent:@"GTData/list"];
//
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//
//    NSData *readListData = [fileManager contentsAtPath:listDataPath];
//
//    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[Information class], nil]  fromData:readListData error:nil];
//
//    if ([unarchiveObj isKindOfClass:[NSArray class]] && [unarchiveObj count] > 0) {
//        return (NSArray<Information *> *)unarchiveObj;
//    }
//    return nil;;
//}
- (void)_archiveListDataWithArray:(NSArray<Information *> *)array{

    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];

    NSFileManager *fileManager = [NSFileManager defaultManager];

    //创建文件夹
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"GTData"];
    NSError *creatError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&creatError];

    //创建文件
    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];

    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
    

    //其他文件的操作演示
    
//     [[NSUserDefaults standardUserDefaults] setObject:listData forKey:@"listData"];
//
//    NSData *testListdata = [[NSUserDefaults standardUserDefaults] dataForKey:@"listData"];
//
//    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[GTListItem class], nil]  fromData:testListdata error:nil];
    
    //查询文件
//    BOOL fileExist = [fileManager fileExistsAtPath:listDataPath];
    
    //删除
//    if(fileExist){
//        [fileManager removeItemAtPath:listDataPath error:nil];
//    }
    
//    NSFileHandle *fileHandler = [NSFileHandle fileHandleForUpdatingAtPath:listDataPath];
//
//    [fileHandler seekToEndOfFile];
//    [fileHandler writeData:[@"def" dataUsingEncoding:NSUTF8StringEncoding]];
//
//    [fileHandler synchronizeFile];
//    [fileHandler closeFile];
    
}


@end
