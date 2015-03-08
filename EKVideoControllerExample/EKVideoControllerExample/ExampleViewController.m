//
//  ViewController.m
//  EKVideoControllerExample
//
//  Created by Lucas Ortis on 06/03/2015.
//  Copyright (c) 2015 Ekhoo. All rights reserved.
//

#import "ExampleViewController.h"

@interface ExampleViewController ()

@end

@implementation ExampleViewController

- (void)loadView {
    self.view                 = [[UIView alloc] initWithFrame:EK_SCREEN_BOUNDS];
    self.view.backgroundColor = [UIColor whiteColor];
    
    /*** Video player ***/
    self.videoPath = [[NSBundle mainBundle] pathForResource:@"Video" ofType:@"mp4"];
    
    /*** Authentication ackground ***/
    UIView *authBkg         = [[UIView alloc] initWithFrame:CGRectMake(16.0f,
                                                                       CGRectGetMaxY(self.view.bounds) - 150.0f,
                                                                       CGRectGetMaxX(self.view.bounds) - 32.0f,
                                                                       120.0f)];
    authBkg.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5f];
    
    /*** Facebook connect button ***/
    UIButton *facebookConnect = [UIButton buttonWithType:UIButtonTypeCustom];
    [facebookConnect setBackgroundImage:[UIImage imageNamed:@"facebook-connect"] forState:UIControlStateNormal];
    facebookConnect.frame = CGRectMake(0.0f, 0.0f, 270.0f, 60.0f);
    facebookConnect.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMinY(authBkg.frame) + 33.0f);
    
    /*** Log in button ***/
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginButton setTitle:@"Connect with email" forState:UIControlStateNormal];
    loginButton.frame              = CGRectMake(0.0f, 0.0f, 255.0f, 40.0f);
    loginButton.center             = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMaxY(facebookConnect.frame) + 25.0f);
    loginButton.backgroundColor    = [UIColor darkGrayColor];
    loginButton.layer.cornerRadius = 5.0f;
    loginButton.layer.borderColor  = [UIColor lightGrayColor].CGColor;
    loginButton.layer.borderWidth  = 0.5f;
    
    [self.view addSubview:authBkg];
    [self.view addSubview:facebookConnect];
    [self.view addSubview:loginButton];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.repeat        = YES;
    self.maskTintColor = [UIColor blackColor];
    self.maskAlpha     = 0.5f;
    
    [self play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
