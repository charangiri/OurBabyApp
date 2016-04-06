//
//  DrugAlergyListVC.h
//  BabyApp
//
//  Created by Vishal Kolhe on 04/04/16.
//  Copyright © 2016 Infinity. All rights reserved.
//

#import "BaseViewController.h"

@interface DrugAlergyListVC : BaseViewController <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *listOfObjects;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
