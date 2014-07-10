//
//  ViewController.m
//  clearUITextField
//
//  Created by Gabriel Massana on 10/07/2014.
//  Copyright (c) 2014 Gabriel Massana. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *numberToAdd1;
@property (strong, nonatomic) IBOutlet UIButton *calculate1;
@property (strong, nonatomic) IBOutlet UILabel *label1;

@property (strong, nonatomic) IBOutlet UITextField *numberToAdd2;
@property (strong, nonatomic) IBOutlet UIButton *calculate2;
@property (strong, nonatomic) IBOutlet UILabel *label2;

@property (strong, nonatomic) IBOutlet UITextField *numberToAdd3;
@property (strong, nonatomic) IBOutlet UIButton *calculate3;
@property (strong, nonatomic) IBOutlet UILabel *label3;


@property (strong, nonatomic) NSString *urlRegEx;
@property (strong, nonatomic) NSPredicate *urlRegExTest;

@property (nonatomic) BOOL calculate2Done;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.urlRegEx = @"((-)?[0-9]*)";
    self.urlRegExTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", self.urlRegEx];
    
    self.numberToAdd1.delegate = self;
    self.numberToAdd2.delegate = self;
    
    self.calculate2Done = false;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)calculate1:(id)sender {
    
    [self dismissAllKeyboards];
    
    // if text is a valid Number
    if ([self.urlRegExTest evaluateWithObject:self.numberToAdd1.text]) {
        
        int sum = [self.label1.text intValue] + [self.numberToAdd1.text intValue];
        self.label1.text = [NSString stringWithFormat:@"%d", sum];
    }
    
}
- (IBAction)calculate2:(id)sender {
    
    [self dismissAllKeyboards];
    
    // if text is a valid Number
    if ([self.urlRegExTest evaluateWithObject:self.numberToAdd2.text]) {
        
        int sum = [self.label2.text intValue] + [self.numberToAdd2.text intValue];
        self.label2.text = [NSString stringWithFormat:@"%d", sum];
        
        self.calculate2Done = true;
    }
}

- (IBAction)calculate3:(id)sender {
    
    [self dismissAllKeyboards];
    
    // if text is a valid Number
    if ([self.urlRegExTest evaluateWithObject:self.numberToAdd3.text]) {
        
        int sum = [self.label3.text intValue] + [self.numberToAdd3.text intValue];
        self.label3.text = [NSString stringWithFormat:@"%d", sum];
        
        self.numberToAdd3.text = @"";
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {

    if (textField == self.numberToAdd1) {
        self.numberToAdd1.text = @"";
    }
    else if (textField == self.numberToAdd2)
    {
        if (self.calculate2Done)
        {
            self.numberToAdd2.text = @"";
            self.calculate2Done = false;
        }
    }
}

- (void) dismissAllKeyboards {
    [self.numberToAdd1 resignFirstResponder];
    [self.numberToAdd2 resignFirstResponder];
    [self.numberToAdd3 resignFirstResponder];
}

@end
