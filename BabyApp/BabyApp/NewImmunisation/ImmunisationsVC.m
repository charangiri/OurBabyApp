//
//  ImmunisationsVC.m
//  BabyApp
//
//  Created by Jiten on 09/04/16.
//  Copyright (c) 2016 Infinity. All rights reserved.
//

#import "ImmunisationsVC.h"
#import "AllImmunisationCell.h"
#import "DueImmunisationCell.h"

@interface ImmunisationsVC () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation ImmunisationsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"tool"] style:UIBarButtonItemStyleDone target:self action:@selector(onClickAddNew:)];
    self.imuNavigationItem.rightBarButtonItem = rightButton;
    
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:NO];
}

-(void)onClickAddNew:(id)sender
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.segmentImu.selectedSegmentIndex == 0)
    {
        AllImmunisationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AllImmunisationCell"];
        [cell setBackgroundColor:[UIColor whiteColor]];
        return cell;
    }
    else
    {
        DueImmunisationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DueImmunisationCell"];
        [cell setBackgroundColor:[UIColor whiteColor]];
        return cell;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CGRect frame = tableView.frame;
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 41)];
    [headerView setBackgroundColor:[UIColor colorWithRed:231.0f/255.0f green:231.0/255.0f blue:235.0f/255.0f alpha:1.0]];
    
    UILabel *lblHeader = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x, 10, frame.size.width, 21)];
    [lblHeader setText:@"Section title"];
    [headerView addSubview:lblHeader];
    
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (IBAction)onClickSwitch:(id)sender
{
    if (self.segmentImu.selectedSegmentIndex == 0)
    {
        
    }
    else if(self.segmentImu.selectedSegmentIndex == 1)
    {
        
    }
    else if(self.segmentImu.selectedSegmentIndex == 2)
    {
        
    }
}
@end
