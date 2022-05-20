//
//  SceneDelegate.m
//  TVweibo
//
//  Created by Admin on 2022/5/13.
//

#import "SceneDelegate.h"
#import "ViewController.h"
#import "FindViewController.h"
#import "MessageViewController.h"
#import "MyViewController.h"
#import "SearchViewController.h"
#import "OAuthViewController.h"
#import "FindViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate



- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    self.window=[[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    

    UITabBarController *tabbarController=[[UITabBarController alloc] init];
    
    
    ViewController *viewController=[[ViewController alloc] init];
    UINavigationController *navigationControllerWeb=[[UINavigationController alloc] initWithRootViewController:viewController];
    viewController.view.backgroundColor=[UIColor whiteColor];
    navigationControllerWeb.tabBarItem.title=@"微博";
    navigationControllerWeb.tabBarItem.image=[UIImage imageNamed:@"weibo.png"];
    //viewController.title=@"歌曲";
    
    FindViewController *findViewController=[[FindViewController alloc] init];
    UINavigationController *navigationControllerFind=[[UINavigationController alloc] initWithRootViewController:findViewController];
    findViewController.view.backgroundColor=[UIColor whiteColor];
    navigationControllerFind.tabBarItem.title=@"发现";
    navigationControllerFind.tabBarItem.image=[UIImage imageNamed:@"faxian.png"];
    
    OAuthViewController *con =[OAuthViewController new];
    UINavigationController *navigationControllercon=[[UINavigationController alloc] initWithRootViewController:con];
    con.view.backgroundColor=[UIColor whiteColor];
    navigationControllercon.tabBarItem.title=@"授权";
    navigationControllercon.tabBarItem.image=[UIImage imageNamed:@"授权.png"];
    
    MessageViewController *messageViewController=[[MessageViewController alloc] init];
    UINavigationController *navigationControllerMessage=[[UINavigationController alloc] initWithRootViewController:messageViewController];
    messageViewController.view.backgroundColor=[UIColor whiteColor];
    navigationControllerMessage.tabBarItem.title=@"消息";
    navigationControllerMessage.tabBarItem.image=[UIImage imageNamed:@"xiaoxi.png"];
    
    MyViewController *myController=[[MyViewController alloc] init];
    UINavigationController *navigationControllerMy=[[UINavigationController alloc] initWithRootViewController:myController];
    myController.view.backgroundColor=[UIColor whiteColor];
    navigationControllerMy.tabBarItem.title=@"我的";
    navigationControllerMy.tabBarItem.image=[UIImage imageNamed:@"wode.png"];
        
    [tabbarController setViewControllers:@[navigationControllerWeb,navigationControllerFind,navigationControllercon,navigationControllerMessage,navigationControllerMy]];
    
    
    self.window.rootViewController=tabbarController;
    
//显示
    [self.window makeKeyAndVisible];
    
}





- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
