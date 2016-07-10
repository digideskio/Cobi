//
// Created by Nickolay Sheika on 7/10/16.
// Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Contact;



@interface ContactViewModel : NSObject


@property(nonatomic, strong, readonly) NSManagedObjectID *modelID;
@property(nonatomic, strong, readonly) NSString *fullName;
@property(nonatomic, strong, readonly) NSString *phoneNumberFormatted;

- (instancetype)initWithModelID:(NSManagedObjectID *)modelID
                       fullName:(NSString *)fullName
           phoneNumberFormatted:(NSString *)phoneNumberFormatted NS_DESIGNATED_INITIALIZER;
+ (instancetype)modelWithModelID:(NSManagedObjectID *)modelID
                        fullName:(NSString *)fullName
            phoneNumberFormatted:(NSString *)phoneNumberFormatted;


@end



@interface ContactViewModel (Unavailable)


- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end