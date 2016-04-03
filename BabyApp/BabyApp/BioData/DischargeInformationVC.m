//
//  DischargeInformationVC.m
//  BabyApp
//
//  Created by Vishal Kolhe on 02/04/16.
//  Copyright © 2016 Infinity. All rights reserved.
//

#import "DischargeInformationVC.h"
#import "CommonSelectionListVC.h"
#import "CustomIOS7AlertView.h"
#import "DateTimeUtil.h"

@interface DischargeInformationVC () <CustomIOS7AlertViewDelegate, CommonSelectionListVCDelegate>
{
    CustomIOS7AlertView *dateAlertView;
    NSInteger selectedIndex;
    UIDatePicker *datePicker;
    
    UITapGestureRecognizer *dateTapGesture, *breastFeedTapGesture;
}
@end

@implementation DischargeInformationVC

-(void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self addTapGestures];
}

-(void)openCommonSelectionVC
{
    CommonSelectionListVC *commonSelectionVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CommonSelectionListVC_SB_ID"];
    [commonSelectionVC setDelegate:self];
    [self.navigationController pushViewController:commonSelectionVC animated:YES];
}

-(void)openDate
{
    dateAlertView = [[CustomIOS7AlertView alloc] init];
    [dateAlertView setContainerView:[self createDateView]];
    [dateAlertView setButtonTitles:[NSMutableArray arrayWithObjects:@"CLOSE", @"SET", nil]];
    [dateAlertView setDelegate:self];
    [dateAlertView setUseMotionEffects:true];
    dateAlertView.tag = selectedIndex;
    
    [dateAlertView show];
}

- (UIView *)createDateView
{
    UIView *demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 216)];
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectZero];
    datePicker.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    datePicker.frame = CGRectMake(10, 10, 280, 216);
    datePicker.datePickerMode = UIDatePickerModeDate;
    [demoView addSubview:datePicker];
    return demoView;
}

- (void)customIOS7dialogButtonTouchUpInside: (CustomIOS7AlertView *)alertView clickedButtonAtIndex: (NSInteger)buttonIndex
{
    [dateAlertView close];
    NSString * dateFromData = [DateTimeUtil stringFromDateTime:datePicker.date withFormat:@"dd-MM-yyyy"];
    
    switch (selectedIndex) {
        case 1:
        {
            [self.txtFldDate setText:dateFromData];
        }
            break;
            
        default:
            break;
    }
}

-(void)addTapGestures
{
    dateTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickBaseDateView:)];
    [self.baseDateView addGestureRecognizer:dateTapGesture];
    
    breastFeedTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickBreastView:)];
    [self.baseBreastFeed addGestureRecognizer:breastFeedTapGesture];
}

-(void)onClickBaseDateView:(UITapGestureRecognizer *)aTapGesture
{
    selectedIndex = 1;
    [self openDate];
    //[self openCommonSelectionVC];
}

-(void)onClickBreastView:(UITapGestureRecognizer *)aTapGesture
{
    selectedIndex = 2;
    [self openCommonSelectionVC];
}

-(void)selectedValue:(NSString *)aSelected
{
    if(selectedIndex == 2)
    {
        [self.txtFldBreastFeed setText:aSelected];
    }
}



@end
