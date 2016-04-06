//
//  HealthBookletViewController.h
//  BabyApp
//
//  Created by Charan Giri on 28/03/16.
//  Copyright © 2016 Infinity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "SlideNavigationController.h"
@interface HealthBookletViewController : BaseViewController<SlideNavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIView *baseCircleView;
- (IBAction)screeningAction:(id)sender;
- (IBAction)childSafetyAction:(id)sender;

@end
