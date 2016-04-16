//
//  ChildDevelopementalViewController.m
//  BabyApp
//
//  Created by Pramod Ganapati Patil on 15/04/16.
//  Copyright © 2016 Infinity. All rights reserved.
//

#import "ChildDevelopementalViewController.h"
#import "ASValueTrackingSlider.h"

@interface ChildDevelopementalViewController ()<ASValueTrackingSliderDataSource>

    
@property (strong, nonatomic) IBOutlet ASValueTrackingSlider *slider;



@end

@implementation ChildDevelopementalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [self.slider setNumberFormatter:formatter];

    _slider.minimumValue = 1;
    _slider.maximumValue = 12;
   _slider.popUpViewCornerRadius = 12.0;
    [_slider setMaxFractionDigitsDisplayed:0];
//    slider.popUpViewColor = [UIColor colorWithHue:0.55 saturation:0.8 brightness:0.9 alpha:0.7];
    _slider.popUpViewColor = [UIColor darkGrayColor];
    
    _slider.font = [UIFont boldSystemFontOfSize:16];
   _slider.textColor = [UIColor whiteColor];
    _slider.dataSource = self;
    self.title = @"Child Developemental Screening";
    

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

#pragma mark - slider datasources
- (NSString *)slider:(ASValueTrackingSlider *)slider stringForValue:(float)value;
{
    value = roundf(value);
    NSString *s = [NSString  stringWithFormat:@"%d MONTTHS",(int)value];
    if (value == 1) {
        s = [NSString  stringWithFormat:@"%d MONTH",(int)value];
    }
//    if (value < -10.0) {
//        s = @"❄️Brrr!⛄️";
//    } else if (value > 29.0 && value < 50.0) {
//        s = [NSString stringWithFormat:@"😎 %@ 😎", [slider.numberFormatter stringFromNumber:@(value)]];
//    } else if (value >= 50.0) {
//        s = @"I’m Melting!";
//    }
    
    return s;
}

@end
