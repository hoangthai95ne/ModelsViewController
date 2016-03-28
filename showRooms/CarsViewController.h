//
//  CarsViewController.h
//  showRooms
//
//  Created by Hoàng Thái on 3/24/16.
//  Copyright © 2016 techmaster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataManager.h"

@interface CarsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) Object *selectedObject;

@end
