//
//  ACDemoMasterViewController.m
//  ACCategoriesDemo
//
//  Created by Alessandro Calzavara on 23/11/12.
//  Copyright (c) 2012 Alessandro Calzavara. All rights reserved.
//

#import "ACDemoMasterViewController.h"

@interface ACDemoMasterViewController ()
@property (strong, nonatomic) NSArray * demos;
@end

@implementation ACDemoMasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.demos = @[
        
        @"ACDemoResizableImageViewController"
        
        ];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.title = @"Choose a demo";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.demos count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    NSString * className = self.demos[indexPath.row];
    cell.textLabel.text = className;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * className = self.demos[indexPath.row];
    
    UIViewController * demoViewController = [[NSClassFromString(className) alloc] initWithNibName:className bundle:nil];
    
    [self.navigationController pushViewController:demoViewController animated:YES];
}

@end
