//
//  BioDataTableViewController.m
//  BabyApp
//
//  Created by Charan Giri on 20/02/16.
//  Copyright © 2016 Infinity. All rights reserved.
//

#import "BioDataTableViewController.h"
#import "ProfilePicTableViewCell.h"
#import "BioDataTableViewCell.h"
#import "KeyConstants.h"
#import "BioDataObj.h"
#import "ConnectionsManager.h"
#import "BirthRecordTableViewController.h"

@interface BioDataTableViewController () <ServerResponseDelegate>
{
    NSArray *titleArray;
    
    BioDataObj *bioDataObj;
    
    //CustomIOS7AlertView *dateAlertView;
    UIDatePicker *datePicker;
}
@end

@implementation BioDataTableViewController


- (IBAction)onClickDoneButton:(id)sender {
    
    ProfilePicTableViewCell *cell = (ProfilePicTableViewCell*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:@"" forKey:@"baby_image"];
    [params setObject:cell.btnDateOfBirth.titleLabel.text forKey:@"dob"];
    [params setObject:cell.txtFldName.text forKey:@"name"];
    [params setObject:@"64" forKey:@"user_id"];
    [params setObject:@"10" forKey:@"child_id"];
    [params setObject:[NSNumber numberWithInt:1] forKey:@"action"];
    
    [[ConnectionsManager sharedManager] saveBioData:params andImage:cell.userProflePic withdelegate:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    titleArray=[NSArray arrayWithObjects:@"",@"BIRTH RECORD",@"PARTICULAR OF PARENTS",@"SIGNIFICANT EVENTS",@"NEWBORN SCREENING",@"INVESTIGATION(S) DONE (if any)",@"INFORMATION ON DISCHARGE", nil];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self loadBioData];
}

-(void)loadBioData
{
    NSNumber *childID = [[NSUserDefaults standardUserDefaults] objectForKey:@"child_id"];
    ///if(childID && childID != nil)
    // {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"10" forKey:@"child_id"];
    
    [[ConnectionsManager sharedManager] getBioData:dict withdelegate:self];
    //}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if (indexPath.row==0)
    {
        return 270;
    }
    else
    {
        return 50;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ProfilePicTableViewCell *cell = nil;
    BioDataTableViewCell *cell1=nil;
    
    if (indexPath.row==0)
    {
        cell=(ProfilePicTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"ProfilePicCellIdentifier"];
        [cell.btnDateOfBirth addTarget:self action:@selector(onClickDateOfBirth:) forControlEvents:UIControlEventTouchUpInside];
        [cell.txtFldName setText:bioDataObj.name];
        [cell.btnDateOfBirth.titleLabel setText:bioDataObj.dob];
        
        
        return cell;
    }
    else
    {
        cell1 = (BioDataTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"BioDataCellIdentifier"];
        cell1.titleLabel.text=titleArray[indexPath.row];
        
        //        cell1.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"blue_background_small.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ];
        //        cell1.selectedBackgroundView =  [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"blue_background_small.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ];
        
        return cell1;
        
    }
    
    
    
    //BioDataCellIdentifier  ProfilePicCellIdentifier
    
    // Configure the cell...
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==1)
        [self performSegueWithIdentifier:@"birthSegue" sender:self];
    else if(indexPath.row == 2)
    {
        [self performSegueWithIdentifier:Segue_ParticularsOfParentsVC sender:self];
    }
    else if (indexPath.row == 4)
    {
        //NewbornScreeningVC_Segue
        [self performSegueWithIdentifier:Segue_NewbornScreeningVC sender:self];
        
    }
    else if (indexPath.row == 5)
    {
        //NewbornScreeningVC_Segue
        [self performSegueWithIdentifier:Segue_investigationOptions sender:self];
        
    }
    else if (indexPath.row == 6)
    {
        //DischargeInformationSegue
        [self performSegueWithIdentifier:Segue_DischargeInformation sender:self];
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"birthSegue"]) {
        BirthRecordTableViewController *controller = (BirthRecordTableViewController *)segue.destinationViewController;
        controller.selectedBioData = bioDataObj;
    }
    
}

-(void)onClickDateOfBirth:(id)sender
{
    
}

-(void)success:(id)response
{
    NSDictionary *dict = response;
    id statusStr_ = [dict objectForKey:@"status"];
    NSString *statusStr;
    
    if([statusStr_ isKindOfClass:[NSNumber class]])
    {
        statusStr = [statusStr_ stringValue];
    }
    if([statusStr isEqualToString:@"1"])
    {
        
        bioDataObj = [[BioDataObj alloc] init];
        
        NSDictionary *datDict = [dict objectForKey:@"data"];
        bioDataObj.name = [datDict objectForKey:@"name"];
        bioDataObj.dob = [datDict objectForKey:@"dob"];
        
        [self.tableView reloadData];
    }
}

-(void)failure:(id)response
{
    
}

@end
