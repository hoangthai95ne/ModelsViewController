//
//  DetailsViewController.m
//  showRooms
//
//  Created by Hoàng Thái on 3/28/16.
//  Copyright © 2016 techmaster. All rights reserved.
//

#import "DetailsViewController.h"
#define PHOTO_WIDTH 290
#define PHOTO_HEIGHT 435

@interface DetailsViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UILabel *lblNAme;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;


@end

@implementation DetailsViewController {
    NSArray *modelInCompany;
}
- (IBAction)btnDone:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)pageControlValueChaned:(UIPageControl *)sender {
    self.scrollView.contentOffset = CGPointMake(self.pageControl.currentPage * PHOTO_WIDTH, 0);
    [self labelUpdating];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DataManager *dataManager = [[DataManager alloc] init];
    [dataManager loadData];
    
    NSMutableArray *tempModel = [[NSMutableArray alloc] init];
    for (Object* object in dataManager.arrayObjects) {
        if ([self.selectedObject.company isEqualToString:object.company]) {
            [tempModel addObject:object];
        }
    }
    Object *tempObject = tempModel[0];
    [tempModel removeObjectAtIndex:0];
    [tempModel addObject:tempObject];
    
    modelInCompany = tempModel;
    
    self.pageControl.numberOfPages = modelInCompany.count;
    
    self.scrollView.contentSize = CGSizeMake(PHOTO_WIDTH * modelInCompany.count, 435);
    self.scrollView.pagingEnabled = YES;
    for (int i = 0; i < modelInCompany.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:((Object*)modelInCompany[i]).photo];
        imageView.frame = CGRectMake(i * PHOTO_WIDTH, 0, PHOTO_WIDTH, PHOTO_HEIGHT);
        [self.scrollView addSubview:imageView];
    }
    
    [self labelUpdating];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.pageControl.currentPage = self.scrollView.contentOffset.x / PHOTO_WIDTH;
    [self labelUpdating];
}

- (void)labelUpdating {
    Object *object = modelInCompany[self.pageControl.currentPage];
    self.lblNAme.text = object.name;
    self.lblPrice.text = object.price;
}


@end
