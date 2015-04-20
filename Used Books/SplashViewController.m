//
//  SplashViewController.m
//  Used Books
//
//  Created by Vimal Atreya Ramaka on 2015-04-19.
//  Copyright (c) 2015 Vimal Atreya Ramaka. All rights reserved.
//

#import "SplashViewController.h"
#import "EditViewController.h"
#import "ListViewController.h"
#import "ListingViewController.h"
#import "MasterViewController.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)goPostBook:(id)sender {
    EditViewController *evc = [[EditViewController alloc] initWithNibName:@"EditViewController" bundle:nil];
    evc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:evc animated:YES];
}

- (IBAction)goFindBook:(id)sender {
    ListViewController *lvc = [[ListViewController alloc] initWithNibName:@"ListViewController" bundle:nil];
    lvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:lvc animated:YES];

}
@end
