//
// Created by Nickolay Sheika on 7/9/16.
// Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//

#import "BaseTableViewCell.h"



@implementation BaseTableViewCell


+ (NSString *)reuseIdentifier
{
    return NSStringFromClass([self class]);
}


@end