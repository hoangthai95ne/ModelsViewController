//
//  Object.m
//  showRooms
//
//  Created by Hoàng Thái on 3/24/16.
//  Copyright © 2016 techmaster. All rights reserved.
//

#import "Object.h"

@implementation Object

- (instancetype)initWithCompany:(NSString *)company 
                           name:(NSString *)name 
                          price:(NSString *)price 
                        version:(NSString *)version 
                    andPhotoURL:(NSString *)photoURL {
    
    if (self = [super init]) {
        self.company = company;
        self.name = name;
        self.price = price;
        self.version = version;
        self.photo = [UIImage imageNamed:photoURL];
    }
    
    return self;
}

@end
