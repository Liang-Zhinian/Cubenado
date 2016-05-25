//
//  ViewController.h
//  Cubenado
//
//  Created by Conor Sweeney on 5/24/16.
//  Copyright © 2016 Conor Sweeney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CubeView.h"
#import <GLKit/GLKit.h>
#import <SceneKit/SceneKit.h>
#import <QuartzCore/QuartzCore.h>


@interface ViewController : UIViewController

-(void)createCube;
-(void)sliderAction;
-(void)randomnessSliderAction;

@property (strong,nonatomic) UIView *tornadoContainerView;

@property (strong,nonatomic) UILabel *cubeNumber;
@property (strong,nonatomic) UISlider *cubeNumberSlider;

@property (strong,nonatomic) UILabel *randomnessNumber;
@property (strong,nonatomic) UISlider *randomnessSlider;



@end

