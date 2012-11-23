//
//  ACDemoResizableImageViewController.m
//  ACCategoriesDemo
//
//  Created by Alessandro Calzavara on 23/11/12.
//  Copyright (c) 2012 Alessandro Calzavara. All rights reserved.
//

#import "ACDemoResizableImageViewController.h"
#import "UIImage+ACResizableImage.h"

@interface ACDemoResizableImageViewController ()

@end

@implementation ACDemoResizableImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    UIImage * original = [UIImage imageNamed:@"resizable_image"];
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(22, 17, 22, 17);
    
    UIImage * resizableImage = [original acResizableImageWithCapInsets:edgeInsets];
    
    self.imageViewOriginal.image = original;
    
    self.imageView50x50.image   = resizableImage;
    self.imageView150x50.image  = resizableImage;
    self.imageView50x150.image  = resizableImage;
    self.imageView150x150.image = resizableImage;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
