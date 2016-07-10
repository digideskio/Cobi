//
//  AppDelegate.m
//  Cobi
//
//  Created by Nickolay Sheika on 7/9/16.
//  Copyright © 2016 Nickolay Sheika. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseViewController.h"
#import "CoreDataStackBuilder.h"



@interface AppDelegate ()

@end



@implementation AppDelegate


- (BOOL)          application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    APCDController *coreDataStack = [[CoreDataStackBuilder new] buildCoreDataStack];

    CoreDataStackInjector *injector = [CoreDataStackInjector injectorWithCoreDataStack:coreDataStack];
    [injector injectInFirstViewControllerOfNavigationController:(UINavigationController *) self.window.rootViewController];

    return YES;
}

@end
