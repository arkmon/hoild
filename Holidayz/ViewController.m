//
//  ViewController.m
//  Holidayz
//
//  Created by Arkadiusz Dowejko on 28/02/2015.
//  Copyright (c) 2015 Arkadiusz Dowejko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)didTouchDateField:(id)sender {
    
    self.tempDate = [[NSDate alloc]init];
    self.tempDate = self.datePicker.date;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"dd MMMM yyyy"];
    NSDate *someDate = self.datePicker.date;
    
    NSDate *date = [NSDate date];
    
//    if(timeChanged)
//    {
//        date = [self.timePicker date];
//        timeChanged = NO;
//    }
//    else
//    {
//        date = eventTimeBackUP;
//    }
    
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:someDate];
    
    NSTimeInterval interval = sourceGMTOffset;
    
    self.tempDate = [[NSDate alloc] initWithTimeInterval:interval sinceDate:someDate];
    self.dateField.text = [dateFormat stringFromDate:self.tempDate];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    unsigned unitFlagsDate = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    unsigned unitFlagsTime = NSCalendarUnitHour | NSCalendarUnitMinute |  NSCalendarUnitSecond;
    
    NSDateComponents *timeComponents = [gregorian components:unitFlagsTime fromDate:date];
    NSDateComponents *dateComponents = [gregorian components:unitFlagsDate fromDate:someDate];
    
    [dateComponents setSecond:[timeComponents second]];
    [dateComponents setHour:[timeComponents hour]];
    [dateComponents setMinute:[timeComponents minute]];
    
    NSDate *combDate = [gregorian dateFromComponents:dateComponents];
    
    self.tempDate = [[NSDate alloc] initWithTimeInterval:interval sinceDate:combDate];
    //eventDateBackUp = self.tempDate;
    
    
}

@end
