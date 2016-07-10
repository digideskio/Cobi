//
// Created by Nickolay Sheika on 7/9/16.
// Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BaseCoreDataFactory : NSObject


+ (instancetype)factoryWithManagedObjectContext:(NSManagedObjectContext *)context;
- (instancetype)initWithManagedObjectContext:(NSManagedObjectContext *)context NS_DESIGNATED_INITIALIZER;

@property(strong, nonatomic, readonly) NSManagedObjectContext *context;

@end



@interface BaseCoreDataFactory (Unavailable)


- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end