//
//  MedicalConditionVC.m
//  BabyApp
//
//  Created by Vishal Kolhe on 05/04/16.
//  Copyright © 2016 Infinity. All rights reserved.
//

#import "MedicalConditionVC.h"
#import "ConditionData.h"
#import "MedicalConditionCell.h"
#import "AllergyConditionVC.h"
@implementation MedicalConditionVC
@synthesize listOfObjects;

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self loadData];
}

-(void)loadData
{
    NSMutableArray *temp = [NSMutableArray array];
    
    ConditionData *drugData = [[ConditionData alloc] init];
    drugData.condition = @"Condition1";
    drugData.desc = @"Aenean solicitudin, forem quis bibendum auctor, nisi elit conseques ipdum, Aenean solicitudin, forem quis bibendum auctor, nisi elit conseques ipdum";
    
    [temp addObject:drugData];
    
    drugData = [[ConditionData alloc] init];
    drugData.condition = @"Condition2";
    drugData.desc = @"Aenean solicitudin, forem quis bibendum auctor, nisi elit conseques ipdum, Aenean solicitudin, forem quis bibendum auctor, nisi elit conseques ipdum";
    
    [temp addObject:drugData];
    
    drugData = [[ConditionData alloc] init];
    drugData.condition = @"Condition23";
    drugData.desc = @"Aenean solicitudin, forem quis bibendum auctor, nisi elit conseques ipdum, Aenean solicitudin, forem quis bibendum auctor, nisi elit conseques ipdum";
    
    listOfObjects = temp;
    
    [self.tableView reloadData];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return listOfObjects.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"MedicalConditionCell";
    MedicalConditionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    ConditionData *data = [listOfObjects objectAtIndex:indexPath.row];
    cell.editButton.tag=indexPath.row+100;
    [cell.editButton addTarget:self
                     action:@selector(editMedical:) forControlEvents:UIControlEventTouchDown];
    [cell populateData:data];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
- (IBAction)AddButtonAction:(id)sender {
    UIStoryboard *storyboard = self.navigationController.storyboard;
    
    AllergyConditionVC *detailPage = [storyboard
                                instantiateViewControllerWithIdentifier:@"AllergyConditionVC_SB_ID"];
    
    [self.navigationController pushViewController:detailPage animated:YES];
    

}

-(IBAction)editMedical:(id)sender
{
    UIStoryboard *storyboard = self.navigationController.storyboard;
    
    AllergyConditionVC *detailPage = [storyboard
                                      instantiateViewControllerWithIdentifier:@"AllergyConditionVC_SB_ID"];
    
    [self.navigationController pushViewController:detailPage animated:YES];
    
}
@end
