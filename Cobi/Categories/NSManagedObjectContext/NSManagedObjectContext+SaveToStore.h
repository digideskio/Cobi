//
// Created by Nickolay Sheika on 2/18/16.
// Copyright (c) 2016 Alterplay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface NSManagedObjectContext (SaveToStore)

- (void)performBlockAndSave:(void (^)())block
                 completion:(void (^)(NSError *))completion;
- (void)saveToPersistentStoreWithCompletion:(void (^)(NSError *))completion;
@end