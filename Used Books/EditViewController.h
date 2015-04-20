//
//  EditViewController.h
//  Used Books
//
//  Created by Vimal Atreya Ramaka on 2015-04-18.
//  Copyright (c) 2015 Vimal Atreya Ramaka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *bookName;
@property (weak, nonatomic) IBOutlet UITextField *courseName;
@property (weak, nonatomic) IBOutlet UITextField *authorName;
@property (weak, nonatomic) IBOutlet UITextField *price;
@property (weak, nonatomic) IBOutlet UIStepper *edition;
@property (weak, nonatomic) IBOutlet UIPickerView *condition;
- (IBAction)saveBook:(UIBarButtonItem *)sender;
- (IBAction)backAction:(UIBarButtonItem *)sender;

@end
