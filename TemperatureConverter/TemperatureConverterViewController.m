//
//  TemperatureConverterViewController.m
//  TemperatureConverter
//
//  Created by Hong  Wang on 7/29/13.
//  Copyright (c) 2013 HongWang. All rights reserved.
//

#import "TemperatureConverterViewController.h"

@interface TemperatureConverterViewController ()

@property (nonatomic) BOOL direction;
- (void) updateValues;

@end

@implementation TemperatureConverterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Temperature Converter";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.direction = TRUE;
    self.faTextField.delegate = self;
    self.ceTextField.delegate = self;
    [self.convertButton addTarget:self action:@selector(updateValues) forControlEvents:UIControlEventAllEvents];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITextField delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onDoneButton)];
    textField.text = @"";
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = nil;
    
    if(textField.tag == 1) {
        self.direction = YES;
    } else if(textField.tag == 2) {
        self.direction = NO;
    }
    
    return YES;
}


#pragma mark - Private methods

- (void)onDoneButton {
    [self.view endEditing:YES];

}

- (void)onConvertButton {
    
     [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues {
    
    if(self.direction) {
        float temp = [self.faTextField.text floatValue];
        float convertedC = (temp - 32.0) * 5.0 / 9.0;
        self.ceTextField.text = [NSString stringWithFormat:@"%0.2f", convertedC];
    } else {
        float temp = [self.ceTextField.text floatValue];
        float convertedF = temp * 9.0 / 5.0 + 32.0;
        self.faTextField.text = [NSString stringWithFormat:@"%0.2f", convertedF];
    }
}

@end
