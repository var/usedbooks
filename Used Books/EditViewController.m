//
//  EditViewController.m
//  Used Books
//
//  Created by Vimal Atreya Ramaka on 2015-04-18.
//  Copyright (c) 2015 Vimal Atreya Ramaka. All rights reserved.
//

#import "EditViewController.h"
#import <Parse/Parse.h>
#import "MasterViewController.h"

@interface EditViewController (){
    NSArray *_conditionOpts;
}

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    _conditionOpts = @[@"Brand New", @"Barely Used", @"Worn"];
//    
//    self.condition.dataSource = self;
//    self.condition.delegate = self;

    //self.navigationItem.leftBarButtonItem = self.backButtonItem;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(backAction:)];
    
    self.navigationItem.leftBarButtonItem = backButton;
    
    UIBarButtonItem *saveButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveValues)];
    self.navigationItem.rightBarButtonItem = saveButtonItem;
}

- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == [alertView cancelButtonIndex]){
        MasterViewController *mvc = [[MasterViewController alloc] initWithNibName:@"MasterViewController" bundle:nil];
        mvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:mvc animated:YES];
    }else{
        //reset clicked
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(UIBarButtonItem *)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)goMasterView:(id)sender {
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveBook:(UIBarButtonItem *)sender {
    PFObject *book = [PFObject objectWithClassName:@"Book"];
    book[@"bookName"] = _bookName.text;
    book[@"authorName"] = _authorName.text;
    book[@"courseDept"] = _courseName.text;
    [book saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
            UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Status"
                                                               message:@"The book has been saved successfully."
                                                              delegate:self
                                                     cancelButtonTitle:@"OK"
                                                     otherButtonTitles:nil];
            [theAlert show];
        } else {
            // There was a problem, check error.description
            UIAlertView *theAlertErr = [[UIAlertView alloc] initWithTitle:@"Status"
                                                               message:@"There has been an error saving the book, please try later."
                                                              delegate:self
                                                     cancelButtonTitle:@"OK"
                                                     otherButtonTitles:nil];
            [theAlertErr show];
        }
    }];
}

@end
