//
//  BirthRecordTableViewController.m
//  BabyApp
//
//  Created by Charan Giri on 22/02/16.
//  Copyright © 2016 Infinity. All rights reserved.
//

#import "BirthRecordTableViewController.h"
#import "CommonSelectionListVC.h"
#import "DateTimeUtil.h"
#import "CustomIOS7AlertView.h"

@interface BirthRecordTableViewController () <CommonSelectionListVCDelegate, CustomIOS7AlertViewDelegate>
{
    NSArray *identifierNames;
    
    UITapGestureRecognizer *genderGesture, *ethnicGesture, *modeDeliveryGesture, *apgarMinDurationGesture, *apgarMaxDurationGesture, *durationGesture;
    NSString *keyString;
    
    NSInteger selectedIndex;
    CustomIOS7AlertView *dateAlertView;
    UIDatePicker *datePicker;
}
@end

@implementation BirthRecordTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.minDurationView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.minDurationView.layer.borderWidth = 1.0f;
    
    
    self.maxDurationView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.maxDurationView.layer.borderWidth = 1.0f;
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidLayoutSubviews
{
    [self.scrollView setContentSize:CGSizeMake(self.view.frame.size.width, self.baseHeadCircumferenceView.frame.origin.y+self.baseDurationGestationView.frame.size.height + 20)];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self addGestures];
}

-(void)addGestures
{
    genderGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickGenderButton:)];
    [self.baseSexView addGestureRecognizer:genderGesture];
    
    ethnicGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickEthnicGesture:)];
    [self.baseEthnicGroupView addGestureRecognizer:ethnicGesture];
    
    modeDeliveryGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickModeDeliveryGesture:)];
    [self.baseModeOfDeliveryView addGestureRecognizer:modeDeliveryGesture];
    
    apgarMinDurationGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickApgarMinScoreGesture:)];
    [self.minDurationView addGestureRecognizer:apgarMinDurationGesture];
    
    apgarMaxDurationGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickApgarMaxScoreGesture:)];
    [self.maxDurationView addGestureRecognizer:apgarMaxDurationGesture];
    
    durationGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickDurationGesture:)];
    [self.baseDurationGestationView addGestureRecognizer:durationGesture];
}

-(void)onClickGenderButton:(UIGestureRecognizer *)aGesture
{
    selectedIndex = 1;
    keyString = @"Gender";
    [self openCommonSelectionVC];
}

-(void)onClickEthnicGesture:(UITapGestureRecognizer *)aTapGesture
{
    selectedIndex = 2;
    keyString = @"Ethnic";
    [self openCommonSelectionVC];
}

-(void)onClickModeDeliveryGesture:(UITapGestureRecognizer *)aTapGesture
{
    selectedIndex = 3;
    keyString = @"Delivery";
    [self openCommonSelectionVC];
}

-(void)onClickApgarMinScoreGesture:(UITapGestureRecognizer *)aTapGesture
{
    selectedIndex = 4;
    keyString = @"MinScore";
    [self openCommonSelectionVC];
}

-(void)onClickApgarMaxScoreGesture:(UITapGestureRecognizer *)aTapGesture
{
    selectedIndex = 5;
    keyString = @"MaxScore";
    [self openCommonSelectionVC];
}

//onClickDurationGesture
-(void)onClickDurationGesture:(UITapGestureRecognizer *)aTapGesture
{
    selectedIndex = 6;
    [self openDate];
}

-(void)selectedValue:(NSString *)aSelectedValue
{
    switch (selectedIndex) {
        case 1:
        {
            [self.txtFldSex setText:aSelectedValue];
        }
            break;
        case 2:
        {
            [self.txtFldEthnicGroup setText:aSelectedValue];
        }
            break;
        case 3:
        {
            [self.txtFldModeofDelivery setText:aSelectedValue];
        }
            break;
        case 4:
        {
            [self.lblMinDuration setText:aSelectedValue];
        }
            break;
        case 5:
        {
            [self.lblMaxDuration setText:aSelectedValue];
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
    commonSelectionVC.keyString = keyString;
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
        case 6:
        {
            [self.txtFldDurationGestation setText:dateFromData];
        }
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClickPreviousButton:(id)sender {
}

- (IBAction)onClickNextButton:(id)sender {
}
@end
