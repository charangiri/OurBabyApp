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
#import "AddAllergyVC.h"
#import "NSUserDefaults+Helpers.h"
#import "WSConstant.h"

@implementation DrugAlergyListVC
@synthesize listOfObjects;

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //[self loadData];
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
    [self loadAlergyList];
}

-(void)loadAlergyList
{
    //get_allergy_list
    
    NSString *childID = [NSUserDefaults retrieveObjectForKey:CURRENT_CHILD_ID];
    if(childID && childID != nil)
    {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict setObject:childID forKey:@"child_id"];
        [[ConnectionsManager sharedManager] getAlergyList:dict withdelegate:self];
    }
    else
    {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict setObject:@"52" forKey:@"child_id"];
        [[ConnectionsManager sharedManager] getAlergyList:dict withdelegate:self];
    }
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
    cell.btnEdit.tag=indexPath.row+100;
    [cell.btnEdit addTarget:self
                     action:@selector(editAlergy:) forControlEvents:UIControlEventTouchDown];
    [cell populateData:data];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DrugAlergyData *drugData = [listOfObjects objectAtIndex:indexPath.row];
    
    UIStoryboard *storyboard = self.navigationController.storyboard;
    
    AddAllergyVC *detailPage = [storyboard
                                instantiateViewControllerWithIdentifier:@"AddAllergyVC_SB_ID"];
    detailPage.drugAlergyData = drugData;
    [self.navigationController pushViewController:detailPage animated:YES];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
- (IBAction)addDrug:(id)sender {
    UIStoryboard *storyboard = self.navigationController.storyboard;
    
    AddAllergyVC *detailPage = [storyboard
                                instantiateViewControllerWithIdentifier:@"AddAllergyVC_SB_ID"];
    
    [self.navigationController pushViewController:detailPage animated:YES];
    
    
}
-(void)editAlergy:(id)sender
{
    //    UIStoryboard *storyboard = self.navigationController.storyboard;
    //
    //    AddAllergyVC *detailPage = [storyboard
    //                                instantiateViewControllerWithIdentifier:@"AddAllergyVC_SB_ID"];
    //
    //    [self.navigationController pushViewController:detailPage animated:YES];
}

-(void)success:(id)response
{
    /*
     {
     data =     {
     "allergy list" =         (
     );
     "child_id" = 52;
     };
     message = success;
     status = 1;
     }
     */
    NSDictionary *dict = response;
    id statusStr_ = [dict objectForKey:@"status"];
    NSString *statusStr;
    
    if([statusStr_ isKindOfClass:[NSNumber class]])
    {
        statusStr = [statusStr_ stringValue];
    }
    else
    {
        statusStr = statusStr_;
    }
    if([statusStr isEqualToString:@"1"])
    {
        NSDictionary *dataDict = [dict objectForKey:@"data"];
        NSArray *alleryList = [dataDict objectForKey:@"allergy list"];
        if(alleryList.count)
        {
            
            NSMutableArray *temp = [NSMutableArray array];
            
            for(NSDictionary *dict in alleryList)
            {
                //drugTitle, *reaction, *date, *status
                DrugAlergyData *drug = [[DrugAlergyData alloc] init];
                drug.reaction = [dict objectForKey:@"allergic_reaction"];
                drug.drugTitle = [dict objectForKey:@"drug_name"];
                drug.status = [dict objectForKey:@"status"];
                drug.date = [dict objectForKey:@"date"];
                drug.drugID = [dict objectForKey:@"id"];
                
                [temp addObject:drug];
                
            }
            
            listOfObjects = temp;
            
        }
        [self.tableView reloadData];
    }
    
    
}

-(void)failure:(id)response
{
    
}
@end
