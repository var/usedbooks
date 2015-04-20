//
//  ListViewController.m
//  Used Books
//
//  Created by Vimal Atreya Ramaka on 2015-04-19.
//  Copyright (c) 2015 Vimal Atreya Ramaka. All rights reserved.
//

#import "ListViewController.h"
#import "EditViewController.h"
#import <Parse/Parse.h>

@interface ListViewController ()
@property NSMutableArray *objects;
@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"Book"];
    
    NSLog(@"this");
    
    [query setLimit: 200];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *bookobjects, NSError *error) {
        if (!error) {
            self.objects = bookobjects;
            
//            for (id tempObject in _objects) {
//                NSLog(@"Single element: %@", tempObject);
//            }
            
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSLog(@"%ld", (long)indexPath.row);
    
    
    PFObject *book = self.objects[indexPath.row];
    
    cell.textLabel.text = book[@"bookName"];
    
    return cell;
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)awakeFromNib {
    [super awakeFromNib];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)goLVPostBook:(id)sender {
    EditViewController *evc = [[EditViewController alloc] initWithNibName:@"EditViewController" bundle:nil];
    evc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:evc animated:YES];
}

- (IBAction)goLVBack:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
@end
