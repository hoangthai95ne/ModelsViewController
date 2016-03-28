//
//  Object.h
//  showRooms
//
//  Created by Hoàng Thái on 3/24/16.
//  Copyright © 2016 techmaster. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Object : NSObject
@property (nonatomic, strong) NSString *company;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *version;
@property (nonatomic, strong) UIImage *photo;

- (instancetype)initWithCompany: (NSString *) company 
                           name: (NSString *) name 
                          price: (NSString *) price 
                        version: (NSString *) version 
                    andPhotoURL: (NSString *) photoURL;

@end
