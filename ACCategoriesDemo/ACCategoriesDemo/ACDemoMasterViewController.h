//
//  ACDemoMasterViewController.h
//  ACCategoriesDemo
//
//  Created by Alessandro Calzavara on 23/11/12.
//  Copyright (c) 2012 Alessandro Calzavara. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ACDemoDetailViewController;

@interface ACDemoMasterViewController : UITableViewController

@property (strong, nonatomic) ACDemoDetailViewController *detailViewController;

@end
