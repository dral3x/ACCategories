//
//  ACDemoDetailViewController.h
//  ACCategoriesDemo
//
//  Created by Alessandro Calzavara on 23/11/12.
//  Copyright (c) 2012 Alessandro Calzavara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ACDemoDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
