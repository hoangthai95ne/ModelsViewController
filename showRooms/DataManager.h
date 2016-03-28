//
//  DataManager.h
//  showRooms
//
//  Created by Hoàng Thái on 3/24/16.
//  Copyright © 2016 techmaster. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <AVFoundation/AVFoundation.h>
#import "Object.h"

@interface DataManager : NSObject

@property (nonatomic, strong) NSArray *arrayObjects;
@property (nonatomic, strong) NSArray *arrayCompany;

- (void) loadData;

@end
