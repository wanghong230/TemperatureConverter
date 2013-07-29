//
//  TemperatureConverterViewController.h
//  TemperatureConverter
//
//  Created by Hong  Wang on 7/29/13.
//  Copyright (c) 2013 HongWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TemperatureConverterViewController : UIViewController <UITextFieldDelegate>


@property (nonatomic, weak) IBOutlet UITextField *faTextField;
@property (nonatomic, weak) IBOutlet UITextField *ceTextField;
@property (nonatomic, weak) IBOutlet UIButton *convertButton;

- (IBAction)onDoneButton;
- (IBAction)onConvertButton;

@end
