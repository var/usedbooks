//
//  ListingViewController.h
//  Used Books
//
//  Created by Vimal Atreya Ramaka on 2015-04-19.
//  Copyright (c) 2015 Vimal Atreya Ramaka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListingViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) NSArray *bookArray;

@end
