//
//  DetailViewController.h
//  Used Books
//
//  Created by Vimal Atreya Ramaka on 2015-04-18.
//  Copyright (c) 2015 Vimal Atreya Ramaka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

