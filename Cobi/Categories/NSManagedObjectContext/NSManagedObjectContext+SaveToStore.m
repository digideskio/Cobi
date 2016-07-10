//
// Created by Nickolay Sheika on 2/18/16.
// Copyright (c) 2016 Alterplay. All rights reserved.
//

#import "NSManagedObjectContext+SaveToStore.h"



@implementation NSManagedObjectContext (SaveToStore)


- (void)performBlockAndSave:(void (^)())block
                 completion:(void (^)(NSError *))completion
{
    [self performBlock:^{
        if (block) {
            block();
        }

        [self saveToPersistentStoreWithCompletion:completion];
    }];
}

- (void)saveToPersistentStoreWithCompletion:(void (^)(NSError *))completion
{
    if (! self.hasChanges) {
        if (completion) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil);
            });
        }
        return;
    }

    [self performBlock:^{
        NSError *error = nil;
        [self save:&error];

        if (error) {
            if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(error);
                });
            }
            return;
        }

        if (self.parentContext) {
            [self.parentContext saveToPersistentStoreWithCompletion:completion];
        }
        else {
            if (completion)
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(nil);
                });
            }
        }
    }];
}


@end