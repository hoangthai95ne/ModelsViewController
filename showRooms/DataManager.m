//
//  DataManager.m
//  showRooms
//
//  Created by Hoàng Thái on 3/24/16.
//  Copyright © 2016 techmaster. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

- (void)loadData {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"DataObject" ofType:@"plist"];
    
    NSArray *data = [NSArray arrayWithContentsOfFile:filePath];
    
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    for (NSDictionary *item in data) {
        Object *object = [[Object alloc] initWithCompany:[item objectForKey:@"company"] 
                                                    name:[item objectForKey:@"name"] 
                                                   price:[item objectForKey:@"price"] 
                                                 version:[item objectForKey:@"version"] 
                                             andPhotoURL:[item objectForKey:@"photo"]];
        [temp addObject:object];
    }
    
    self.arrayObjects = temp;
    
    NSMutableArray *tempCompany = [[NSMutableArray alloc] init];
    [tempCompany addObject:self.arrayObjects[0]];
    for (Object *objectInArrayObjects in self.arrayObjects) {
        BOOL check = true;
        for (Object *companyObject in tempCompany) {
            if ([companyObject.company isEqualToString:objectInArrayObjects.company]) {
                check = false;
            }
        }
        if (check) {
            [tempCompany addObject:objectInArrayObjects];
        }
    }
    
    self.arrayCompany = tempCompany;

//    NSLog(@"%lu", (unsigned long)self.arrayCompany.count);
}

@end
