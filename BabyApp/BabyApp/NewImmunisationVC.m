//
//  NewImmunisationVC.m
//  BabyApp
//
//  Created by Vishal Kolhe on 07/04/16.
//  Copyright © 2016 Infinity. All rights reserved.
//

#import "NewImmunisationVC.h"
#import "ConnectionsManager.h"

@interface NewImmunisationVC()<ServerResponseDelegate>

@property (strong, nonatomic) IBOutlet UITextField *vaccineTextField;
@property (strong, nonatomic) IBOutlet UITextField *sequenceTextField;
@property (strong, nonatomic) IBOutlet UITextField *siteOfvaccinationTextField;
@property (strong, nonatomic) IBOutlet UITextField *dateGiveTextField;
@property (strong, nonatomic) IBOutlet UITextField *batchNoTextField;
@property (strong, nonatomic) IBOutlet UITextField *brandOfVaccineTextField;
@property (strong, nonatomic) IBOutlet UITextField *doctorTextField;
@property (strong, nonatomic) IBOutlet UITextField *clinicTextField;

@end

@implementation NewImmunisationVC
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title =@"New Immunisation";
    self.navigationItem.rightBarButtonItem = [self addRightButton];
    
    
}
#pragma mark - addding left bar bu

-(UIBarButtonItem *)addRightButton
{
    //    UIImage *buttonImage = [UIImage imageNamed:@"teeth.png"];
    
    UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [aButton setTitle:@"SAVE" forState:UIControlStateNormal];
    
    //    [aButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    
    aButton.frame = CGRectMake(0.0, 0.0, 40,40);
    
    UIBarButtonItem *aBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:aButton];
    
    [aButton addTarget:self action:@selector(saveAction) forControlEvents:UIControlEventTouchUpInside];
    
    return aBarButtonItem;
}

#pragma mark - save action
-(void)saveAction
{
    
    NSString *vaccine = _vaccineTextField.text.length > 0 ? _vaccineTextField.text :@"";
    
    NSString *sequence = _sequenceTextField.text.length > 0 ? _sequenceTextField.text :@"";
    NSString *siteOfvaccination = _siteOfvaccinationTextField.text.length> 0 ? _siteOfvaccinationTextField.text : @"";
    
    NSString *dateGive = _dateGiveTextField.text.length> 0 ? _dateGiveTextField.text : @"";
    NSString *batchNo = _batchNoTextField.text.length> 0 ? _batchNoTextField.text : @"";
    
    NSString *brandOfVaccine = _brandOfVaccineTextField.text.length> 0 ? _brandOfVaccineTextField.text : @"";
    
    NSString *doctor = _doctorTextField.text.length> 0 ? _doctorTextField.text : @"";
    NSString *clinic = _clinicTextField.text.length> 0 ? _clinicTextField.text : @"";
    NSDictionary *params = @{
                             @"user_id":@64,
                             @"child_id":@10,
                             @"vaccine_type":[NSNumber numberWithInt:[vaccine intValue]],
                             @"sequence":sequence,
                             @"site_of_vaccination":siteOfvaccination,
                             @"date_given":dateGive,
                             @"batch_no":batchNo,
                             @"brand_of_vaccine":brandOfVaccine,
                             @"doctor":doctor,
                             @"clinic":clinic,
                             @"contraindications":@"test contrindicaions"
                            };
    
    [self callAddImmunisationWebservice:params];
    
    
}

#pragma mark - calling the add immunisataion webservice
-(void)callAddImmunisationWebservice:(NSDictionary *)paramaterDict
{
    [[ConnectionsManager sharedManager] addImmunisation:paramaterDict withdelegate:self];

}
#pragma mark - ServerResponseDelegate
-(void)success:(id)response
{
    NSLog(@"Success Response of the add immunisation : %@ ",response);
}
-(void)failure:(id)response
{
    NSLog(@"Failure Response of the add immunisation : %@ ",response);

}

@end
