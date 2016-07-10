//
//  InMemoryCoreDataTests.m
//  Zoomlee
//
//  Created by Evgeniy Gurtovoy on 1/16/15.
//  Copyright (c) 2015 Alterplay. All rights reserved.
//

#import "InMemoryCoreDataTests.h"



@implementation InMemoryCoreDataTests


- (void)setUp
{
    [super setUp];

    self.coreDataStack = [APCDController controllerWithStoreType:NSInMemoryStoreType andName:@"Cobi"];
}

@end
