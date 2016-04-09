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
    // Do any additional setup after loading the view.
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
        return cell;
    }
    else
    {
        DueImmunisationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DueImmunisationCell"];
        return cell;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CGRect frame = tableView.frame;
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 41)];
    [headerView setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *lblHeader = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x, 10, frame.size.width, 21)];
    [lblHeader setText:@"Section title"];
    [headerView addSubview:lblHeader];
    
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
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
