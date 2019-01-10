//
//  AppDelegate.m
//  XL3DTouchDemo
//
//  Created by Mac-Qke on 2019/1/10.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import "AppDelegate.h"
#import "XLMainViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    XLMainViewController *mainVC = [[XLMainViewController  alloc] init];
    UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:mainVC];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = navigationVC;
    
    [self initShortcutItems];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    //这里可以获的shortcutItem对象的唯一标识符
    //不管APP在后台还是进程被杀死，只要通过主屏快捷操作进来的，都会调用这个方法
}

- (void)initShortcutItems {
    if ([UIApplication sharedApplication].shortcutItems.count >=4) {
        return;
    }
    
    NSMutableArray *arrShortcutItem = (NSMutableArray *)[UIApplication  sharedApplication].shortcutItems;
    
    UIApplicationShortcutItem *shortItem1 = [[UIApplicationShortcutItem alloc] initWithType:@"com.HYCF.XL3DTouchDemo.openSearch" localizedTitle:@"搜索" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch] userInfo:nil];
    [arrShortcutItem addObject:shortItem1];
    
    UIApplicationShortcutItem *shortItem2 = [[UIApplicationShortcutItem alloc] initWithType:@"com.HYCF.XL3DTouchDemo.openCompose" localizedTitle:@"" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeCompose] userInfo:nil];
    [arrShortcutItem addObject:shortItem2];
    
    [UIApplication sharedApplication].shortcutItems = arrShortcutItem;
    
    NSLog(@"%lu",[UIApplication sharedApplication].shortcutItems.count);
}


@end
