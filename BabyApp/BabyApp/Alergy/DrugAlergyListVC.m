//
//  DrugAlergyListVC.m
//  BabyApp
//
//  Created by Vishal Kolhe on 04/04/16.
//  Copyright © 2016 Infinity. All rights reserved.
//

#import "DrugAlergyListVC.h"
#import "DrugAlergyCell.h"
#import "DrugAlergyData.h"

@implementation DrugAlergyListVC
@synthesize listOfObjects;

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self loadData];
}

-(void)loadData
{
    NSMutableArray *temp = [NSMutableArray array];
    
    DrugAlergyData *drugData = [[DrugAlergyData alloc] init];
    drugData.drugTitle = @"Panadol";
    drugData.reaction = @"Reaction: Anaphylaxis";
    drugData.date = @"Date: 05/0612016";
    drugData.status = @"Confirmed: allergy";
    
    [temp addObject:drugData];
    
    drugData = [[DrugAlergyData alloc] init];
    drugData.drugTitle = @"Drug 2";
    drugData.reaction = @"Reaction: Anaphylaxis";
    drugData.date = @"Date: 05/0612016";
    drugData.status = @"Confirmed: allergy";
    
    [temp addObject:drugData];
    
    drugData = [[DrugAlergyData alloc] init];
    drugData.drugTitle = @"Drug 3";
    drugData.reaction = @"Reaction: Anaphylaxis";
    drugData.date = @"Date: 05/0612016";
    drugData.status = @"Confirmed: allergy";
    
    [temp addObject:drugData];
    
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
    static NSString *cellIdentifier = @"DrugAlergyCell";
    DrugAlergyCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    DrugAlergyData *data = [listOfObjects objectAtIndex:indexPath.row];
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
@end
