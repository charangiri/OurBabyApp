//
//  HealthBookletViewController.m
//  BabyApp
//
//  Created by Charan Giri on 28/03/16.
//  Copyright © 2016 Infinity. All rights reserved.
//

#import "HealthBookletViewController.h"
#import "ScreeningViewController.h"
#import "DrugAlergyListVC.h"
#import "MedicalConditionVC.h"
@interface HealthBookletViewController ()
{
    float width;
    float imageSize;
    UIView *overlayView;
    UIView *percentailOverlayView;
    UIView *oralOverlayView;


}
@end

@implementation HealthBookletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self circleViewCreation];
  
    overlayView=[UIView new];
    overlayView.frame=self.view.frame;
    overlayView.backgroundColor = [[UIColor clearColor] colorWithAlphaComponent:0.2];
    [overlayView setHidden:YES];
    [self.view addSubview:overlayView];

    
    percentailOverlayView=[UIView new];
    percentailOverlayView.frame=self.view.frame;
    percentailOverlayView.backgroundColor = [[UIColor clearColor] colorWithAlphaComponent:0.2];
    [percentailOverlayView setHidden:YES];
    [self.view addSubview:percentailOverlayView];
    
    oralOverlayView=[UIView new];
    oralOverlayView.frame=self.view.frame;
    oralOverlayView.backgroundColor = [[UIColor clearColor] colorWithAlphaComponent:0.2];
    [oralOverlayView setHidden:YES];
    [self.view addSubview:oralOverlayView];
    
    
    

}
- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return NO;
}

-(void)circleViewCreation
{
//    width= 250;
//    imageSize=70;
//   
//    
//    
//    CAShapeLayer *circleLayer = [CAShapeLayer layer];
//    [circleLayer setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(_baseCircleView.frame.origin.x, _baseCircleView.frame.origin.y, width, width)] CGPath]];
//    [[_baseCircleView layer] addSublayer:circleLayer];
//    [circleLayer setStrokeColor:[[UIColor grayColor] CGColor]];
//    [circleLayer setFillColor:[[UIColor clearColor] CGColor]];
//    [circleLayer setLineWidth:  15.0f];
//    
//    float  centerImageLocation =width/2 -imageSize/2;
//    
//    UIView *circleView=[[UIView alloc] initWithFrame:CGRectMake(centerImageLocation, centerImageLocation, imageSize, imageSize)];
//    circleView.backgroundColor = [UIColor blueColor];
//    [_baseCircleView addSubview:circleView];
    
    /*
    UIButton *immunisationButton;
    UIButton *screeningButton;
    UIButton *percentilesButton;
    UIButton *oralButton;
    UIButton *allergyButton;
    
    
    immunisationButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [immunisationButton setTitle:@"Immun" forState:UIControlStateNormal];
    immunisationButton.frame=CGRectMake(centerImageLocation, -imageSize/2, imageSize, imageSize);
    [_baseCircleView addSubview:immunisationButton];
    
    
    
    screeningButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [screeningButton setTitle:@"screeningButton" forState:UIControlStateNormal];
    screeningButton.frame=CGRectMake(-imageSize/2, imageSize, imageSize, imageSize);
    [_baseCircleView addSubview:screeningButton];
    
    
    percentilesButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [percentilesButton setTitle:@"percentilesButton" forState:UIControlStateNormal];
    percentilesButton.frame=CGRectMake(width-imageSize/2, imageSize, imageSize, imageSize);
    [_baseCircleView addSubview:percentilesButton];
    
    
    allergyButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [allergyButton setTitle:@"allergyButton" forState:UIControlStateNormal];
    allergyButton.frame=CGRectMake(width/2-imageSize*2, width-imageSize, imageSize, imageSize);
    [_baseCircleView addSubview:allergyButton];
    
    oralButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [oralButton setTitle:@"oralButton" forState:UIControlStateNormal];
    oralButton.frame=CGRectMake(width/2+imageSize, width-imageSize, imageSize, imageSize);
    [_baseCircleView addSubview:oralButton];
    
    [immunisationButton setBackgroundImage:[UIImage imageNamed:@"needle_icon.png"] forState:UIControlStateNormal];
    [screeningButton setBackgroundImage:[UIImage imageNamed:@"needle_icon.png"] forState:UIControlStateNormal];
    [percentilesButton setBackgroundImage:[UIImage imageNamed:@"needle_icon.png"] forState:UIControlStateNormal];
    [allergyButton setBackgroundImage:[UIImage imageNamed:@"needle_icon.png"] forState:UIControlStateNormal];
    [oralButton setBackgroundImage:[UIImage imageNamed:@"needle_icon.png"] forState:UIControlStateNormal];
    
    
    [immunisationButton addTarget:self action:@selector(immunisationButtonAction) forControlEvents:UIControlEventTouchUpInside];
      [screeningButton addTarget:self action:@selector(screeningButtonAction) forControlEvents:UIControlEventTouchUpInside];
     
     */
    [self circleView];
}

-(void)immunisationButtonAction
{
    [self performSegueWithIdentifier:@"immunisationTableSegue" sender:self];
  
    
}

-(void)screeningButtonAction
{
    [self performSegueWithIdentifier:@"activitySegue" sender:self];
    
    
}

-(void)circleView
{
UIImage *storyMenuItemImage = [UIImage imageNamed:@"bg-menuitem.png"];
UIImage *storyMenuItemImagePressed = [UIImage imageNamed:@"bg-menuitem-highlighted.png"];

UIImage *starImage = [UIImage imageNamed:@"icon-star.png"];

// Default Menu

AwesomeMenuItem *starMenuItem1 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                       highlightedImage:storyMenuItemImagePressed
                                                           ContentImage:starImage
                                                highlightedContentImage:nil];
AwesomeMenuItem *starMenuItem2 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                       highlightedImage:storyMenuItemImagePressed
                                                           ContentImage:starImage
                                                highlightedContentImage:nil];
AwesomeMenuItem *starMenuItem3 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                       highlightedImage:storyMenuItemImagePressed
                                                           ContentImage:starImage
                                                highlightedContentImage:nil];
AwesomeMenuItem *starMenuItem4 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                       highlightedImage:storyMenuItemImagePressed
                                                           ContentImage:starImage
                                                highlightedContentImage:nil];
AwesomeMenuItem *starMenuItem5 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                       highlightedImage:storyMenuItemImagePressed
                                                           ContentImage:starImage
                                                highlightedContentImage:nil];

NSArray *menuItems = [NSArray arrayWithObjects:starMenuItem1, starMenuItem2, starMenuItem3, starMenuItem4, starMenuItem5, nil];

AwesomeMenuItem *startItem = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"bg-addbutton.png"]
                                                   highlightedImage:[UIImage imageNamed:@"bg-addbutton-highlighted.png"]
                                                       ContentImage:[UIImage imageNamed:@"icon-plus.png"]
                                            highlightedContentImage:[UIImage imageNamed:@"icon-plus-highlighted.png"]];

AwesomeMenu *menu = [[AwesomeMenu alloc] initWithFrame:self.view.bounds startItem:startItem menuItems:menuItems];
menu.delegate = self;
[_baseCircleView addSubview:menu];


}
- (void)awesomeMenu:(AwesomeMenu *)menu didSelectIndex:(NSInteger)idx
{
    NSLog(@"Select the index : %d",idx);
    
    if (idx ==0) {
        [self performSegueWithIdentifier:@"immunisationTableSegue" sender:self];

    }
    else if (idx==2)
    {
        [self oralAndVisualView];
    }
    else if (idx==4)
    {
        UIStoryboard *storyboard = self.navigationController.storyboard;
        
        ScreeningViewController *detailPage = [storyboard
                                                  instantiateViewControllerWithIdentifier:@"Screening"];
        
        [self.navigationController pushViewController:detailPage animated:YES];
        
    }
    else if(idx ==3)
    {
        [self AllergyAndMedicalView];
    }
    else if(idx ==1)
    {
        [self percentailView];
    }
    
  
    
}
- (void)awesomeMenuDidFinishAnimationClose:(AwesomeMenu *)menu {
    NSLog(@"Menu was closed!");
}
- (void)awesomeMenuDidFinishAnimationOpen:(AwesomeMenu *)menu {
    NSLog(@"Menu is open!");
}

-(void)AllergyAndMedicalView
{
    
    [overlayView setHidden:NO];
   
    UIButton *backButton =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backButton setTitle:@"sda" forState:UIControlStateNormal];
    backButton.frame=CGRectMake(30, self.view.frame.size.height/2, 40, 40);
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [overlayView addSubview:backButton];

    UIButton *drugButton =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [drugButton setTitle:@"drug" forState:UIControlStateNormal];
    drugButton.frame=CGRectMake(30, backButton.frame.origin.y-60, 40, 40);
    [drugButton addTarget:self action:@selector(drugAction) forControlEvents:UIControlEventTouchUpInside];
    [overlayView addSubview:drugButton];
    
    UIButton *medicalButton =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [medicalButton setTitle:@"medical" forState:UIControlStateNormal];
    medicalButton.frame=CGRectMake(30, backButton.frame.origin.y+60, 40, 40);
    [medicalButton addTarget:self action:@selector(medicalAction) forControlEvents:UIControlEventTouchUpInside];
    [overlayView addSubview:medicalButton];
    
}

-(void)backAction
{
    [overlayView setHidden:YES];
 
}

-(void)drugAction
{
    [overlayView setHidden:YES];
    UIStoryboard *storyboard = self.navigationController.storyboard;
    
    DrugAlergyListVC *detailPage = [storyboard
                                           instantiateViewControllerWithIdentifier:@"DrugAlergyListVC_SB_ID"];
    
    [self.navigationController pushViewController:detailPage animated:YES];
    
}

-(void)medicalAction
{
    [overlayView setHidden:YES];
    UIStoryboard *storyboard = self.navigationController.storyboard;
    
    MedicalConditionVC *detailPage = [storyboard
                                           instantiateViewControllerWithIdentifier:@"MedicalConditionVC_SB_ID"];
    
    [self.navigationController pushViewController:detailPage animated:YES];

}


-(void)percentailView
{
    
    [percentailOverlayView setHidden:NO];
    
    UIButton *backButton =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backButton setTitle:@"sda" forState:UIControlStateNormal];
    backButton.frame=CGRectMake(self.view.frame.size.width-80, self.view.frame.size.height/4, 40, 40);
    [backButton addTarget:self action:@selector(overlaybackAction) forControlEvents:UIControlEventTouchUpInside];
    [percentailOverlayView addSubview:backButton];
    [backButton setContentVerticalAlignment:UIControlContentVerticalAlignmentBottom];

  
    
    
    UIButton *headButton =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [headButton setTitle:@"headButton" forState:UIControlStateNormal];
    headButton.frame=CGRectMake(backButton.frame.origin.x-80, backButton.frame.origin.y-60, 40, 40);
    [headButton addTarget:self action:@selector(headAction) forControlEvents:UIControlEventTouchUpInside];
    [percentailOverlayView addSubview:headButton];
    
    UIButton *heightButton =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [heightButton setTitle:@"heightButton" forState:UIControlStateNormal];
    heightButton.frame=CGRectMake(headButton.frame.origin.x, headButton.frame.origin.y+60, 40, 40);
    [heightButton addTarget:self action:@selector(heightAction) forControlEvents:UIControlEventTouchUpInside];
    [percentailOverlayView addSubview:heightButton];
    
    UIButton *weighttButton =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [weighttButton setTitle:@"weighttButton" forState:UIControlStateNormal];
    weighttButton.frame=CGRectMake(headButton.frame.origin.x, heightButton.frame.origin.y+60, 40, 40);
    [weighttButton addTarget:self action:@selector(weightAction) forControlEvents:UIControlEventTouchUpInside];
    [percentailOverlayView addSubview:weighttButton];

    UIButton *bmiButton =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [bmiButton setTitle:@"bmiButton" forState:UIControlStateNormal];
    bmiButton.frame=CGRectMake(headButton.frame.origin.x, weighttButton.frame.origin.y+60, 40, 40);
    [bmiButton addTarget:self action:@selector(bmiAction) forControlEvents:UIControlEventTouchUpInside];
    [percentailOverlayView addSubview:bmiButton];
    
}

-(void)overlaybackAction
{
    [percentailOverlayView setHidden:YES];
    [self performSegueWithIdentifier:@"percentialSegue" sender:self];

    
 
}
-(void)headAction
{
    [percentailOverlayView setHidden:YES];
    [self performSegueWithIdentifier:@"percentialSegue" sender:self];

}

-(void)heightAction
{
    [percentailOverlayView setHidden:YES];
    [self performSegueWithIdentifier:@"percentialSegue" sender:self];

}


-(void)weightAction
{
    [percentailOverlayView setHidden:YES];
    [self performSegueWithIdentifier:@"percentialSegue" sender:self];

}


-(void)bmiAction
{
    [percentailOverlayView setHidden:YES];
    [self performSegueWithIdentifier:@"percentialSegue" sender:self];

}






-(void)oralAndVisualView
{
    
    [oralOverlayView setHidden:NO];
    
    UIButton *backButton =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backButton setTitle:@"sda" forState:UIControlStateNormal];
    backButton.frame=CGRectMake(self.view.frame.size.width-80, self.view.frame.size.height/2, 40, 40);
    [backButton addTarget:self action:@selector(oralbackAction) forControlEvents:UIControlEventTouchUpInside];
    [oralOverlayView addSubview:backButton];
    
    
    
    
    UIButton *oralButton =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [oralButton setTitle:@"headButton" forState:UIControlStateNormal];
    oralButton.frame=CGRectMake(backButton.frame.origin.x, backButton.frame.origin.y-60, 40, 40);
    [oralButton addTarget:self action:@selector(oralAction) forControlEvents:UIControlEventTouchUpInside];
    [oralOverlayView addSubview:oralButton];
    
    UIButton *visualtButton =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [visualtButton setTitle:@"heightButton" forState:UIControlStateNormal];
    visualtButton.frame=CGRectMake(oralButton.frame.origin.x, backButton.frame.origin.y+100, 40, 40);
    [visualtButton addTarget:self action:@selector(visualAction) forControlEvents:UIControlEventTouchUpInside];
    [oralOverlayView addSubview:visualtButton];
    
    
}

-(void)oralbackAction
{
    [oralOverlayView setHidden:YES];
 
}
-(void)oralAction
{
    [oralOverlayView setHidden:YES];
    [self performSegueWithIdentifier:@"activitySegue" sender:self];


}
-(void)visualAction
{
    [oralOverlayView setHidden:YES];
    [self performSegueWithIdentifier:@"activitySegue" sender:self];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (IBAction)screeningAction:(id)sender
{
    UIViewController *dummyVC = [self.storyboard instantiateViewControllerWithIdentifier:SB_ID_DummyVC];
    [self.navigationController pushViewController:dummyVC animated:YES];
}

- (IBAction)childSafetyAction:(id)sender {
}
@end
