//
//  ViewController.h
//  Holidayz
//
//  Created by Arkadiusz Dowejko on 28/02/2015.
//  Copyright (c) 2015 Arkadiusz Dowejko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDelegate>
@property (strong,readwrite,nonatomic) UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *dateField;
@property (nonatomic , strong) NSDate *tempDate;

@end

