//
// Created by Nickolay Sheika on 7/10/16.
// Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//

#import <Foundation/Foundation.h>

@class APCDController;



@protocol CoreDataStackInjectable <NSObject>


@property(nonatomic, strong) APCDController *coreDataStack;
@end



@interface CoreDataStackInjector : NSObject


@property(nonatomic, strong, readonly) APCDController *coreDataStack;

#pragma mark - Init
+ (instancetype)injectorWithCoreDataStack:(APCDController *)controller;
- (instancetype)initWithCoreDataStack:(APCDController *)controller NS_DESIGNATED_INITIALIZER;

#pragma mark - Public
- (void)injectInFirstViewControllerOfNavigationController:(UINavigationController *)navigationController;
- (void)injectIn:(id <CoreDataStackInjectable>)target;
@end



@interface CoreDataStackInjector (Unavailable)


- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end