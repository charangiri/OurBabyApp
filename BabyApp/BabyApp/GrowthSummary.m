//
//  GrowthSummary.m
//  BabyApp
//
//  Created by Atul Awasthi on 17/03/16.
//  Copyright © 2016 Infinity. All rights reserved.
//

#import "GrowthSummary.h"
#import "PercentialViewController.h"
@interface GrowthSummary ()

@end

@implementation GrowthSummary
@synthesize growthSummaryTable;
NSArray *labelArrayGrowthSummary;
- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title =@"Growth Summary";
    labelArrayGrowthSummary=[NSArray arrayWithObjects:@"Percentiles of Head Circumference-for-age,50",@"Percentiles of weight-for-age,50",@"Percentiles of height-for-age,50",@"Percentiles of Body Mass Indec-for-age,60",@"Percentiles of Hearing-for-age,50",@"Percentiles of Eye sight-for-age,30", nil];
    
    UIView *v=[[UIView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 140)];
    [v setBackgroundColor:[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:240.0/255.0 alpha:1.0]];
    [self.view addSubview:v];
    
    
    
    UIView *v2=[[UIView alloc] initWithFrame:CGRectMake(25, v.frame.origin.y+20, self.view.frame.size.width-50, 90)];
    [v2 setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:v2];
    [[v2 layer] setCornerRadius:5];
    [[v2 layer] setBorderColor:[UIColor grayColor].CGColor];
    [[v2 layer] setBorderWidth:1.0];
    UIView *vLine=[[UIView alloc] initWithFrame:CGRectMake(0, v2.frame.size.height/2-0.3, v2.frame.size.width,0.6)];
    [vLine setBackgroundColor:[UIColor grayColor]];
    [v2 addSubview:vLine];
    
    UIView *hLine=[[UIView alloc] initWithFrame:CGRectMake((v2.frame.size.width*70)/100,0,0.6,v2.frame.size.height/2)];
    [hLine setBackgroundColor:[UIColor grayColor]];
    [v2 addSubview:hLine];
    
    UILabel *lblWeight1,*lblWeightValue1,*lblLength1,*lblLengthValue1,*lblCircum1,*lblCircumValue1;
    
    lblWeight1=[[UILabel alloc] initWithFrame:CGRectMake(8,0, (v2.frame.size.width*70)/100-15,(v2.frame.size.height/2)/2)];
    lblWeightValue1=[[UILabel alloc] initWithFrame:CGRectMake(8,(v2.frame.size.height/2)/2, (v2.frame.size.width*70)/100-15,( v2.frame.size.height/2)/2)];
    
    
    lblLength1=[[UILabel alloc] initWithFrame:CGRectMake((v2.frame.size.width*70)/100+8,0,(v2.frame.size.width*30)/100-15,( v2.frame.size.height/2)/2)];
    lblLengthValue1=[[UILabel alloc] initWithFrame:CGRectMake((v2.frame.size.width*70)/100+8,(v2.frame.size.height/2)/2,(v2.frame.size.width*30)/100-15,( v2.frame.size.height/2)/2)];
    
    
    lblCircum1=[[UILabel alloc] initWithFrame:CGRectMake(8,v2.frame.size.height/2,v2.frame.size.width-15,(v2.frame.size.height/2)/2)];
    lblCircumValue1=[[UILabel alloc] initWithFrame:CGRectMake(8,v2.frame.size.height/2+(v2.frame.size.height/2)/2, v2.frame.size.width-15,( v2.frame.size.height/2)/2)];
    
    
    
    [v2 addSubview:lblWeight1];
    [v2 addSubview:lblWeightValue1];
    
    [v2 addSubview:lblLength1];
    [v2 addSubview:lblLengthValue1];
    
    [v2 addSubview:lblCircum1];
    [v2 addSubview:lblCircumValue1];
    
    
    lblWeight1.text=@"WEIGHT";
    lblLength1.text=@"LENGTH";
    lblCircum1.text=@"OCCIPITOFRONTAL CIRCUMFERENCE";
    
    lblWeightValue1.text=@"5.68kg";
    lblLengthValue1.text=@"60cm";
    lblCircumValue1.text=@"39.5cm";
    
    [lblWeightValue1 setTextColor:[UIColor colorWithRed:49.0/255.0 green:191.0/255.0 blue:180.0/255.0 alpha:1.0]];
    //[lblWeightValue1 setTextAlignment:NSTextAlignmentCenter];
    
    [lblLengthValue1 setTextColor:[UIColor colorWithRed:49.0/255.0 green:191.0/255.0 blue:180.0/255.0 alpha:1.0]];
    //[lblLengthValue1 setTextAlignment:NSTextAlignmentCenter];
    
    [lblCircumValue1 setTextColor:[UIColor colorWithRed:49.0/255.0 green:191.0/255.0 blue:180.0/255.0 alpha:1.0]];
    //[lblCircumValue1 setTextAlignment:NSTextAlignmentCenter];
    
    growthSummaryTable=[[UITableView alloc] initWithFrame:CGRectMake(0, v2.frame.origin.y+v2.frame.size.height+10, self.view.frame.size.width, self.view.frame.size.height-(v2.frame.origin.y+v2.frame.size.height+20))];
    [self.view addSubview:growthSummaryTable];
    growthSummaryTable.dataSource=self;
    growthSummaryTable.delegate=self;
    
    
}
//@synthesize growthSummaryTable;
//NSArray *labelArrayGrowthSummary;

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Stores"];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Stores"];
        
        
        UILabel *lblName=nil;
        
        lblName=[[UILabel alloc] initWithFrame:CGRectMake(10,5, growthSummaryTable.frame.size.width-30, 30)];
        lblName.tag=10;
        [cell.contentView addSubview:lblName];
        [lblName setFont:[UIFont fontWithName:@"HelveticaNeueCyr-Light" size:16]];
        
        
        UILabel *lblName2=nil;
        
        lblName2=[[UILabel alloc] initWithFrame:CGRectMake(10,35,60, 30)];
        lblName2.tag=20;
        [cell.contentView addSubview:lblName2];
        [lblName2 setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:14]];
        
        
        UIProgressView *progress=[[UIProgressView alloc] initWithFrame:CGRectMake(75,55, growthSummaryTable.frame.size.width-100, 10)];
        progress.tag=30;
        [cell.contentView addSubview:progress];
        
        
    }
    UILabel *lblName=[cell.contentView viewWithTag:10];
    UILabel *lblName2=[cell.contentView viewWithTag:20];
    
    UIProgressView *progress=[cell.contentView viewWithTag:30];
    
    
    [cell setBackgroundColor:[UIColor whiteColor]];
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    
    
    [lblName setText:[[[labelArrayGrowthSummary objectAtIndex:indexPath.row] componentsSeparatedByString:@","] objectAtIndex:0]];
    
    float n=[[[[labelArrayGrowthSummary objectAtIndex:indexPath.row] componentsSeparatedByString:@","] objectAtIndex:1] floatValue];
    NSString *s=@".0%";
    [lblName2 setText:[NSString stringWithFormat:@"%d%@",(int)n,s]];
    [progress setProgress:n/100.0];
    
    [progress setUserInteractionEnabled:NO];
    [lblName2 setTextColor:[UIColor colorWithRed:49.0/255.0 green:191.0/255.0 blue:180.0/255.0 alpha:1.0]];
    
    return cell;
    
}

//@synthesize growthSummaryTable;
//NSArray *labelArrayGrowthSum
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    //  [[NSUserDefaults standardUserDefaults] setObject:[labelArray objectAtIndex:indexPath.row] forKey:@"selectedScreenLbl"];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSLog(@"didDeselectRowAtIndexPath");
 //  [self performSegueWithIdentifier:@"screeningsumarysegu" sender:self];
   //visual
    
    if (indexPath.row==5) {
        
        UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"visual"];
        [self.navigationController pushViewController:vc animated:YES];

    }
    else{
        
    
    
    PercentialViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"percential"];
    
    
    
    switch (indexPath.row) {
        case 0:
            
            [vc setTitleString:@"Head"];
            [vc setSuffix:@"cm"];
            [vc setYaxisName:@"Cirumference"];
            [vc setTitleLableString:@"PERCENTILES OF HEAD CIRCUMFERENCE-FOR-AGE"];
            [vc setSubTitleLableString:@"GIRLS AGED 0 TO 24 MONTHS"];
            
            break;
        case 2:
            [vc setTitleString:@"Height"];
            [vc setSuffix:@"cm"];
            [vc setYaxisName:@"Height"];
            [vc setTitleLableString:@"PERCENTILES OF HEIGHT-FOR-AGE"];
            [vc setSubTitleLableString:@"GIRLS AGED 0 TO 24 MONTHS"];
            break;
        case 1:
            [vc setTitleString:@"Weight"];
            [vc setSuffix:@"kgs"];
            [vc setYaxisName:@"Weight"];
            [vc setTitleLableString:@"PERCENTILES OF WEIGHT-FOR-AGE"];
            [vc setSubTitleLableString:@"GIRLS AGED 0 TO 24 MONTHS"];
            
            break;
        case 3:
            [vc setTitleString:@"BMI"];
            [vc setSuffix:@"h/w"];
            [vc setYaxisName:@"BMI"];
            [vc setTitleLableString:@"PERCENTILES OF BMI-FOR-AGE"];
            [vc setSubTitleLableString:@"GIRLS AGED 0 TO 24 MONTHS"];
            
            break;
        case 4:
            [vc setTitleString:@"Hearing"];
            [vc setSuffix:@"db"];
            [vc setYaxisName:@"Hearing"];
            [vc setTitleLableString:@"PERCENTILES OF Hearing-FOR-AGE"];
            [vc setSubTitleLableString:@"GIRLS AGED 0 TO 24 MONTHS"];
            
            break;
        
          

            
        default:
            break;
    }

    
    [self.navigationController pushViewController:vc animated:YES];
    }
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return labelArrayGrowthSummary.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
