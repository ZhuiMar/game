//
//  FMDataSelectVC.m
//  FoodManager
//
//  Created by  luzhaoyang on 2020/3/15.
//  Copyright © 2020 guanhua. All rights reserved.
//

#import "FMDataSelectVC.h"

@interface FMDataSelectVC ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *customPicker;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;

@end

@implementation FMDataSelectVC{
    
    NSMutableArray *yearArray;
    NSArray *monthArray;
    NSMutableArray *monthMutableArray;
    NSMutableArray *DaysMutableArray;
    NSMutableArray *DaysArray;
    NSString *currentMonthString;
    
    NSInteger selectedYearRow;
    NSInteger selectedMonthRow;
    NSInteger selectedDayRow;
    
    BOOL firstTimeLoad;
    
    NSInteger m;
    int year;
    int month;
    int day;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    m = 0;
    firstTimeLoad = YES;
    self.customPicker.hidden = NO;

    NSDate *date = [NSDate date];
    
    // Get Current Year
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy"];
    NSString *currentyearString = [NSString stringWithFormat:@"%@",
                                   [formatter stringFromDate:date]];
    year =[currentyearString intValue];
    
    
    // Get Current  Month
    [formatter setDateFormat:@"MM"];
    currentMonthString = [NSString stringWithFormat:@"%ld",(long)[[formatter stringFromDate:date]integerValue]];
    month = [currentMonthString intValue];
    
    // Get Current  Date
    
    [formatter setDateFormat:@"dd"];
    NSString *currentDateString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    day = [currentDateString intValue];
    yearArray = [[NSMutableArray alloc]init];
    monthMutableArray = [[NSMutableArray alloc]init];
    DaysMutableArray= [[NSMutableArray alloc]init];
    for (int i = 1970; i <= year ; i++){
        [yearArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    // PickerView -  Months data
    monthArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12"];
    
    for (int i=1; i<month+1; i++) {
        [monthMutableArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    DaysArray = [[NSMutableArray alloc]init];
    
    for (int i = 1; i <= 31; i++){
        [DaysArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    for (int i = 1; i <day+1; i++){
        [DaysMutableArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    // PickerView - Default Selection as per current Date
    [self.customPicker selectRow:20 inComponent:0 animated:YES];
    
    // [pickerView selectRow:30 inComponent:0 animated:NO];
    [self.customPicker selectRow:[monthArray indexOfObject:currentMonthString] inComponent:1 animated:YES];
    [self.customPicker selectRow:0 inComponent:2 animated:YES];
    [self.sureBtn setTitleColor:[UIColor colorWithHexString:@"#2F8B6E"] forState:UIControlStateNormal];
    self.sureBtn.titleLabel.font = [UIFont fontWithName:FontName size:18];
}


#pragma mark - UIPickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    m = row;
    if (component == 0){
        selectedYearRow = row;
        [self.customPicker reloadAllComponents];
    }
    else if (component == 1){
        selectedMonthRow = row;
        [self.customPicker reloadAllComponents];
    }
    else if (component == 2){
        selectedDayRow = row;
        [self.customPicker reloadAllComponents];
    }
}


#pragma mark - UIPickerViewDatasource
- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component
           reusingView:(UIView *)view {
    
    // Custom View created for each component
    
    UILabel *pickerLabel = (UILabel *)view;
    
    if (pickerLabel == nil) {
        CGRect frame = CGRectMake(0.0, 0.0, 100, 60);
        pickerLabel = [[UILabel alloc] initWithFrame:frame];
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setTextColor:[UIColor colorWithHexString:@"#2F8B6E"]];
        [pickerLabel setFont:[UIFont fontWithName:FontName size:20]];
    }
    
    if (component == 0){
        pickerLabel.text =  [yearArray objectAtIndex:row]; // Year
    }
    else if (component == 1){
        pickerLabel.text =  [monthArray objectAtIndex:row];  // Month
    }
    else if (component == 2){
        pickerLabel.text =  [DaysArray objectAtIndex:row]; // Date
    }
    return pickerLabel;
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0){
        return [yearArray count];
    }
    else if (component == 1){
        NSInteger selectRow =  [pickerView selectedRowInComponent:0];
        int n;
        n= year-1970;
        if (selectRow==n) {
            return [monthMutableArray count];
        }else{
            return [monthArray count];
        }
    }
    else{
        NSInteger selectRow1 =  [pickerView selectedRowInComponent:0];
        int n;
        n= year-1970;
        NSInteger selectRow =  [pickerView selectedRowInComponent:1];
        
        if (selectRow==month-1 &selectRow1==n) {
            
            return day;
            
        }else{
            
            if (selectedMonthRow == 0 || selectedMonthRow == 2 || selectedMonthRow == 4 || selectedMonthRow == 6 || selectedMonthRow == 7 || selectedMonthRow == 9 || selectedMonthRow == 11){
                return 31;
            }
            else if (selectedMonthRow == 1){
                int yearint = [[yearArray objectAtIndex:selectedYearRow]intValue ];
                
                if(((yearint %4==0)&&(yearint %100!=0))||(yearint %400==0)){
                    return 29;
                }
                else
                {
                    return 28; // or return 29
                }
            }
            else
            {
                return 30;
            }
        }
    }
}
- (IBAction)sureAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    NSString *data = [NSString stringWithFormat:@"%@-%@-%@ ",[yearArray objectAtIndex:[self.customPicker selectedRowInComponent:0]],[monthArray objectAtIndex:[self.customPicker selectedRowInComponent:1]],[DaysArray objectAtIndex:[self.customPicker selectedRowInComponent:2]]];
    [self.delegate suerActionWith:data];
}

@end
