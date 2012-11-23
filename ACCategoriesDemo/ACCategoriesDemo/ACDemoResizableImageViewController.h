//
//  ACDemoResizableImageViewController.h
//  ACCategoriesDemo
//
//  Created by Alessandro Calzavara on 23/11/12.
//  Copyright (c) 2012 Alessandro Calzavara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ACDemoResizableImageViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView * imageViewOriginal;
@property (weak, nonatomic) IBOutlet UIImageView * imageView50x50;
@property (weak, nonatomic) IBOutlet UIImageView * imageView150x50;
@property (weak, nonatomic) IBOutlet UIImageView * imageView50x150;
@property (weak, nonatomic) IBOutlet UIImageView * imageView150x150;

@end
