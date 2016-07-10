//
// Created by Nickolay Sheika on 7/9/16.
// Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//

#import <APCDController/APCDController.h>
#import "CoreDataStackBuilder.h"



@implementation CoreDataStackBuilder

- (APCDController *)buildCoreDataStack
{
    return [APCDController controllerWithStoreType:NSInMemoryStoreType andName:@"Cobi"];
}

@end