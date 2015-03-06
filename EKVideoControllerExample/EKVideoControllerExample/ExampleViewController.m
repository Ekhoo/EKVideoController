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
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.videoPath = [[NSBundle mainBundle] pathForResource:@"Video" ofType:@"mp4"];
    self.repeat    = YES;
    
    [self play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
