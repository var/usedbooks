//
//  ListingViewController.m
//  Used Books
//
//  Created by Vimal Atreya Ramaka on 2015-04-19.
//  Copyright (c) 2015 Vimal Atreya Ramaka. All rights reserved.
//

#import "ListingViewController.h"
#import "EditViewController.h"
#import <Parse/Parse.h>
#import "BookViewController.h"
#import "AppDelegate.h"

@interface ListingViewController ()

@end

@implementation ListingViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        [self setTitle:@"Books"];
    }
    
                for (id tempObject in _bookArray) {
                    NSLog(@"Single element 1: %@", tempObject);
                }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Add"
                                                             style:UIBarButtonItemStyleBordered
                                                            target:self
                                                            action:@selector(goVPostBook)];
    [[self navigationItem] setRightBarButtonItem:item];
    
    for (id tempObject in _bookArray) {
        NSLog(@"Single element 2: %@", tempObject);
    }

    
//    [self loadTableData];
    
    [self performSelector:@selector(loadTableData)];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    for (id tempObject in _bookArray) {
        NSLog(@"Single element 3: %@", tempObject);
    }

    // Load the table data //
    [self loadTableData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    
    for (id tempObject in _bookArray) {
        NSLog(@"Single element 4: %@", tempObject);
    }

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    for (id tempObject in _bookArray) {
        NSLog(@"Single element 5: %@", tempObject);
    }

    
    NSLog(@"%ld", [_bookArray count]);
    return [_bookArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"UITableViewCell";
    
    NSLog(@"this is another test");
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    NSLog(@"this test");
    
    PFObject *b = [_bookArray objectAtIndex:[indexPath row]];
//    [[cell textLabel] setText:b[@"bookName"]];
    
    cell.textLabel.text = [b objectForKey:@"bookName"];
    
    
    
    // Configure the cell...
    
    for (id tempObject in _bookArray) {
        NSLog(@"Single element: %@", tempObject);
    }
    
    return cell;
}



// Override to support conditional editing of the table view.
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    // Return NO if you do not want the specified item to be editable.
//    return YES;
//}


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    BookViewController *detailViewController = [[BookViewController alloc] initWithNibName:@"BookViewController" bundle:nil];
    
    // Pass the selected object to the new view controller.
    PFObject *b = [_bookArray objectAtIndex:indexPath.row];
//    [detailViewController setBookId:b.objectId];
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (AppDelegate *)appDelegate {
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

-(void) loadTableData {
    PFQuery *query = [PFQuery queryWithClassName:@"Book"];
    
    [query setLimit: 200];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *bookobjects, NSError *error) {
        if (!error) {
            self.bookArray = bookobjects;
            NSLog(@"loaded data");
            
            for (id tempObject in bookobjects) {
                NSLog(@"Single element: %@", tempObject);
            }

            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        
    }];
    
    [[self tableView] reloadData];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)goVPostBook {
    EditViewController *evc = [[EditViewController alloc] initWithNibName:@"EditViewController" bundle:nil];
    [[self navigationController] pushViewController:evc animated:YES];
}


@end
