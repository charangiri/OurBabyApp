//
//  NewbornScreeningVC.m
//  BabyApp
//
//  Created by Vishal Kolhe on 01/04/16.
//  Copyright © 2016 Infinity. All rights reserved.
//

#import "NewbornScreeningVC.h"
#import "CommonSelectionListVC.h"
#import "CustomIOS7AlertView.h"
#import "DateTimeUtil.h"

@interface NewbornScreeningVC () <CommonSelectionListVCDelegate, CustomIOS7AlertViewDelegate>
{
    UITapGestureRecognizer *DeficiencyTapGesture, *dateTSHTapGesture, *IEMTapGesture, *DateIEMTapGesture, *OAETapGesture, *DateOAETapGesture, *LeftTapGesture, *RightTapGesture, *evaluationTapGesture;
    
    NSInteger selectedIndex;
    
    CustomIOS7AlertView *dateAlertView;
    UIDatePicker *datePicker;
}
@end

@implementation NewbornScreeningVC

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self addTapGestures];
}

-(void)addTapGestures
{
    DeficiencyTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickBaseG6PDView:)];
    [self.baseG6pdView addGestureRecognizer:DeficiencyTapGesture];
    
    dateTSHTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickdateTSHView:)];
    [self.baseDateTF4View addGestureRecognizer:dateTSHTapGesture];
    
    IEMTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickBaseIEMView:)];
    [self.baseIEMScreemingView addGestureRecognizer:IEMTapGesture];
    
    DateIEMTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickBaseDateIEMView:)];
    [self.baseDateIEMScreemingView addGestureRecognizer:DateIEMTapGesture];
    
    OAETapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickBaseOAEView:)];
    [self.baseOAEView addGestureRecognizer:OAETapGesture];
    
    DateOAETapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickdateOAEView:)];
    [self.baseDateOAEView addGestureRecognizer:DateOAETapGesture];
    
    LeftTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickBaseLeftView:)];
    [self.baseLeftPassView addGestureRecognizer:LeftTapGesture];
    
    RightTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickBaseRightView:)];
    [self.baseRightPassView addGestureRecognizer:RightTapGesture];
    
    evaluationTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickBaseEvaluationView:)];
    [self.baseNeedsFurthurView addGestureRecognizer:evaluationTapGesture];
}


-(void)onClickBaseG6PDView:(UITapGestureRecognizer *)aTapGesture
{
    selectedIndex = 1;
    [self openCommonSelectionVC];
}

-(void)onClickdateTSHView:(UITapGestureRecognizer *)aTapGesture
{
    selectedIndex = 2;
    [self openDate];
    //[self openCommonSelectionVC];
}

-(void)onClickBaseIEMView:(UITapGestureRecognizer *)aTapGesture
{
    selectedIndex = 3;
    [self openCommonSelectionVC];
}

-(void)onClickBaseDateIEMView:(UITapGestureRecognizer *)aTapGesture
{
    selectedIndex = 4;
    [self openDate];
    
    //[self openCommonSelectionVC];
}

-(void)onClickBaseOAEView:(UITapGestureRecognizer *)aTapGesture
{
    selectedIndex = 5;
    [self openCommonSelectionVC];
}

-(void)onClickdateOAEView:(UITapGestureRecognizer *)aTapGesture
{
    selectedIndex = 6;
    [self openDate];
}

-(void)onClickBaseLeftView:(UITapGestureRecognizer *)aTapGesture
{
    selectedIndex = 7;
    [self openCommonSelectionVC];
}

-(void)onClickBaseRightView:(UITapGestureRecognizer *)aTapGesture
{
    selectedIndex = 8;
    [self openCommonSelectionVC];
}

-(void)onClickBaseEvaluationView:(UITapGestureRecognizer *)aTapGesture
{
    selectedIndex = 9;
    [self openCommonSelectionVC];
}

-(void)selectedValue:(NSString *)aSelectedValue
{
    switch (selectedIndex) {
        case 1:
        {
            [self.txtFldG6PD setText:aSelectedValue];
        }
            break;
        case 2:
        {
            [self.txtFldTF4Date setText:aSelectedValue];
        }
            break;
        case 3:
        {
            [self.txtFldIEMScreeming setText:aSelectedValue];
        }
            break;
        case 4:
        {
            [self.txtFldDateIEMScreeming setText:aSelectedValue];
        }
            break;
        case 5:
        {
            [self.txtFldOAE setText:aSelectedValue];
        }
            break;
        case 6:
        {
            [self.txtFldDateOAE setText:aSelectedValue];
        }
            break;
        case 7:
        {
            [self.txtFldLeftPass setText:aSelectedValue];
        }
            break;
        case 8:
        {
            [self.txtFldBaseRight setText:aSelectedValue];
        }
            break;
        case 9:
        {
            [self.txtFldNeedFurthur setText:aSelectedValue];
        }
            break;
            
        default:
            break;
    }
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
        case 2:
        {
            [self.txtFldTF4Date setText:dateFromData];
        }
            break;
            
            case 4:
        {
            [self.txtFldDateIEMScreeming setText:dateFromData];
            break;
        }
        case 6:
        {
            [self.txtFldDateOAE setText:dateFromData];
            break;
        }
        default:
            break;
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLayoutSubviews
{
    [self.scrollView setContentSize:CGSizeMake(self.view.frame.size.width, 1000)];
}
- (IBAction)onClickPreviousButton:(id)sender {
}

- (IBAction)onClickNextButton:(id)sender {
}

-(void)openDatePicker
{
    
}
@end
