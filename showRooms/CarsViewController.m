//
//  CarsViewController.m
//  showRooms
//
//  Created by Hoàng Thái on 3/24/16.
//  Copyright © 2016 techmaster. All rights reserved.
//

#import "CarsViewController.h"
#import "DetailsViewController.h"

@interface CarsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CarsViewController {
    DataManager *dataManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    dataManager = [[DataManager alloc] init];
    [dataManager loadData];

}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataManager.arrayCompany.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Object *object = dataManager.arrayCompany[indexPath.row];
    cell.textLabel.text = object.company;
    cell.imageView.image = object.photo;
    cell.detailTextLabel.text = object.version;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetailsViewController* detailsVC = (DetailsViewController*)segue.destinationViewController;
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    detailsVC.selectedObject = dataManager.arrayCompany[selectedIndexPath.row];
}


@end
