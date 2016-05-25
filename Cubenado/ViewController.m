//
//  ViewController.m
//  Cubenado
//
//  Created by Conor Sweeney on 5/24/16.
//  Copyright © 2016 Conor Sweeney. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    self.view.frame = [UIScreen mainScreen].bounds;
    [super viewDidLoad];
    //set view frame to screen
    // Do any additional setup after loading the view, typically from a nib.
    [self setUpView];
    [self createTornadoBoundaries];
    [self createCube];
}

-(void) setUpView{
    //set up view
    //add slider for number of cubes
    CGRect frame = CGRectMake(20, self.view.frame.size.height - 30, self.view.frame.size.width - 40, 10.0);
    self.cubeNumberSlider = [[UISlider alloc] initWithFrame:frame];
    [self.cubeNumberSlider addTarget:self action:@selector(sliderAction) forControlEvents:UIControlEventValueChanged];
    [self.cubeNumberSlider setBackgroundColor:[UIColor clearColor]];
    self.cubeNumberSlider.minimumValue = 10.0;
    self.cubeNumberSlider.maximumValue = 10000.0;
    self.cubeNumberSlider.continuous = YES;
    self.cubeNumberSlider.value = 10.0;
    [self.view addSubview:self.cubeNumberSlider];
    
    //add labels for cube numbers
    //make number property so it changes with slider action
    UILabel *cubeNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width -40, 20)];
    cubeNumberLabel.text = @"Number of Cubes: ";
    [cubeNumberLabel sizeToFit];
    cubeNumberLabel.center = CGPointMake(self.view.center.x, self.cubeNumberSlider.frame.origin.y - cubeNumberLabel.frame.size.height*1.2);
    [self.view addSubview:cubeNumberLabel];
    
    self.cubeNumber = [[UILabel alloc] initWithFrame:CGRectMake(cubeNumberLabel.frame.origin.x + cubeNumberLabel.frame.size.width, cubeNumberLabel.frame.origin.y, self.view.frame.size.width -(cubeNumberLabel.frame.origin.x + cubeNumberLabel.frame.size.width), cubeNumberLabel.frame.size.height)];
    self.cubeNumber.text = [NSString stringWithFormat:@"%d",(int)self.cubeNumberSlider.value];
    [self.view addSubview:self.cubeNumber];
    
    //add slider for number of randomness
    self.randomnessSlider = [[UISlider alloc] initWithFrame:CGRectMake(20, self.cubeNumber.frame.origin.y - self.cubeNumberSlider.frame.size.height - 15, self.view.frame.size.width - 40, 10.0)];
    [self.randomnessSlider addTarget:self action:@selector(randomnessSliderAction) forControlEvents:UIControlEventValueChanged];
    [self.randomnessSlider setBackgroundColor:[UIColor clearColor]];
    self.randomnessSlider.minimumValue = 0.0;
    self.randomnessSlider.maximumValue = 100.0;
    self.randomnessSlider.continuous = YES;
    self.randomnessSlider.value = 10.0;
    [self.view addSubview:self.randomnessSlider];
    
    //label for randomness
    UILabel *randomnessLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width -40, 20)];
    randomnessLabel.text = @"Randomness: ";
    [randomnessLabel sizeToFit];
    randomnessLabel.center = CGPointMake(self.view.center.x, self.randomnessSlider.frame.origin.y - cubeNumberLabel.frame.size.height*1.2);
    [self.view addSubview:randomnessLabel];
    
    self.randomnessNumber = [[UILabel alloc] initWithFrame:CGRectMake(randomnessLabel.frame.origin.x + randomnessLabel.frame.size.width, randomnessLabel.frame.origin.y, self.view.frame.size.width -(randomnessLabel.frame.origin.x + randomnessLabel.frame.size.width), randomnessLabel.frame.size.height)];
    self.randomnessNumber.text = [NSString stringWithFormat:@"%d%%",(int)self.randomnessSlider.value];
    [self.view addSubview:self.randomnessNumber];
    
    self.tornadoContainerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 10 - (self.view.frame.size.height - self.randomnessNumber.frame.origin.y))];
    //self.tornadoContainerView.backgroundColor = [UIColor blackColor];
    self.tornadoContainerView.tintColor = [UIColor blackColor];
    [self.view addSubview:self.tornadoContainerView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)createCube{
    //CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CubeView *myCube = [[CubeView alloc] initWithFrame:self.view.frame];
                        
                        //CGRectMake(100, 200, self.view.bounds.size.width/2, self.view.bounds.size.width/2)
//];
    [self.tornadoContainerView addSubview:myCube];
    
//    CubeView *imageViewForAnimation = myCube;
//    imageViewForAnimation.alpha = 1.0f;
//    CGRect imageFrame = imageViewForAnimation.frame;
//    //Your image frame.origin from where the animation need to get start
//    CGPoint viewOrigin = imageViewForAnimation.frame.origin;
//    viewOrigin.y = viewOrigin.y + imageFrame.size.height / 2.0f;
//    viewOrigin.x = viewOrigin.x + imageFrame.size.width / 2.0f;
//    
//    imageViewForAnimation.frame = imageFrame;
//    imageViewForAnimation.layer.position = viewOrigin;
//    [self.view addSubview:imageViewForAnimation];
//    
//    // Set up fade out effect
//    CABasicAnimation *fadeOutAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
//    [fadeOutAnimation setToValue:[NSNumber numberWithFloat:0.3]];
//    fadeOutAnimation.fillMode = kCAFillModeForwards;
//    fadeOutAnimation.removedOnCompletion = NO;
//    
//    // Set up scaling
//    CABasicAnimation *resizeAnimation = [CABasicAnimation animationWithKeyPath:@"bounds.size"];
//    [resizeAnimation setToValue:[NSValue valueWithCGSize:CGSizeMake(40.0f, imageFrame.size.height * (40.0f / imageFrame.size.width))]];
//    resizeAnimation.fillMode = kCAFillModeForwards;
//    resizeAnimation.removedOnCompletion = NO;
//    
//    // Set up path movement
//    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    pathAnimation.calculationMode = kCAAnimationPaced;
//    pathAnimation.fillMode = kCAFillModeForwards;
//    pathAnimation.removedOnCompletion = NO;
//    pathAnimation.repeatCount = HUGE_VALF;
//    //Setting Endpoint of the animation
//    CGPoint endPoint = CGPointMake(0, 40.0f);
//    //CGPoint endPoint1 = CGPointMake(50, 100.0f);
//
//    //to end animation in last tab use
//    //CGPoint endPoint = CGPointMake( 320-40.0f, 480.0f);
//    CGMutablePathRef curvedPath = CGPathCreateMutable();
//    CGPathMoveToPoint(curvedPath, NULL, viewOrigin.x, viewOrigin.y);
//    CGPathAddCurveToPoint(curvedPath, NULL, endPoint.x, viewOrigin.y, endPoint.x, viewOrigin.y, endPoint.x, endPoint.y);
//
//    CGRect aRect = CGRectMake(50, 100, 300, 80);
//
//    CGPathRef path = CGPathCreateWithEllipseInRect(aRect, nil);
//
//    pathAnimation.path = curvedPath;
//    CGPathRelease(curvedPath);
//    
//    CAAnimationGroup *group = [CAAnimationGroup animation];
//    group.fillMode = kCAFillModeForwards;
//    group.removedOnCompletion = NO;
//    [group setAnimations:[NSArray arrayWithObjects: pathAnimation, nil]];
//    group.duration = 5.f;
//    group.delegate = self;
//    [group setValue:imageViewForAnimation forKey:@"imageViewBeingAnimated"];
//    
//    [imageViewForAnimation.layer addAnimation:group forKey:@"savingAnimation"];
    
}

-(void)createTornadoBoundaries{
//    SCNCone *tornado = [SCNCone coneWithTopRadius:self.view.frame.size.width/2.2 bottomRadius:0 height:self.tornadoContainerView.frame.size.height*.9];
    
    //[self.tornadoContainerView addSubview:tornado];
}

-(void)sliderAction{
    self.cubeNumber.text = [NSString stringWithFormat:@"%d",(int)self.cubeNumberSlider.value];

}
-(void)randomnessSliderAction{
    self.randomnessNumber.text = [NSString stringWithFormat:@"%d%%",(int)self.randomnessSlider.value];
    
}

@end
