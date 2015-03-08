//
//  EKVideoController.m
//  EKVideoControllerExample
//
//  Created by Lucas Ortis on 06/03/2015.
//  Copyright (c) 2015 Ekhoo. All rights reserved.
//
@import MediaPlayer;

#import "EKVideoController.h"

@interface EKVideoController()

@property(nonatomic, strong) MPMoviePlayerController *moviePlayer;
@property(nonatomic, strong) UIView                  *moviePlayerMask;

@end

@implementation EKVideoController

#pragma mark - Life cycle

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _repeat        = YES;
        _videoSpeed    = 1.0f;
        _maskTintColor = [UIColor clearColor];
        _maskAlpha     = 0.0f;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

#pragma mark - Setters

- (void)setVideoPath:(NSString *)videoPath {
    NSParameterAssert(videoPath);
    
    _videoPath = videoPath;

    /*** Movie player ***/
    if (_moviePlayer) {
        [_moviePlayer stop];
        [_moviePlayer.view removeFromSuperview];
        _moviePlayer = nil;
    }

    _moviePlayer                     = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:videoPath]];
    _moviePlayer.view.frame          = EK_SCREEN_BOUNDS;
    _moviePlayer.fullscreen          = YES;
    _moviePlayer.controlStyle        = MPMovieControlStyleNone;
    _moviePlayer.scalingMode         = MPMovieScalingModeAspectFill;
    _moviePlayer.repeatMode          = self.repeat ? MPMovieRepeatModeOne : MPMovieRepeatModeNone;
    _moviePlayer.currentPlaybackRate = self.videoSpeed;
    
    /*** Movie player mask ***/
    if (_moviePlayerMask) {
        [_moviePlayerMask removeFromSuperview];
        _moviePlayerMask = nil;
    }
    
    _moviePlayerMask                 = [[UIView alloc] initWithFrame:EK_SCREEN_BOUNDS];
    _moviePlayerMask.alpha           = self.maskAlpha;
    _moviePlayerMask.backgroundColor = self.maskTintColor;
    
    [self.view addSubview:self.moviePlayer.view];
    [self.view addSubview:self.moviePlayerMask];
    [self.view sendSubviewToBack:self.moviePlayer.view];
}

- (void)setRepeat:(BOOL)repeat {
    NSParameterAssert(self.moviePlayer);
    
    _repeat = repeat;
    
    _moviePlayer.repeatMode = repeat ? MPMovieRepeatModeOne : MPMovieRepeatModeNone;
}

- (void)setVideoSpeed:(CGFloat)videoSpeed {
    NSParameterAssert(self.moviePlayer);
    
    _videoSpeed                          = videoSpeed;
    self.moviePlayer.currentPlaybackRate = _videoSpeed;
}

- (void)setMaskTintColor:(UIColor *)maskTintColor {
    _maskTintColor = maskTintColor;
    
    _moviePlayerMask.backgroundColor = _maskTintColor;
}

- (void)setMaskAlpha:(CGFloat)maskAlpha {
    _maskAlpha = maskAlpha;
    
    _moviePlayerMask.alpha = _maskAlpha;
}

#pragma mark - Video controls

- (void)play {
    NSParameterAssert(self.moviePlayer);
    
    [_moviePlayer play];
}

- (void)stop {
    NSParameterAssert(self.moviePlayer);
    
    [_moviePlayer stop];
}

- (void)pause {
    NSParameterAssert(self.moviePlayer);
    
    [_moviePlayer pause];
}

- (void)restart {
    NSParameterAssert(self.moviePlayer);
    
    [_moviePlayer stop];
    [_moviePlayer play];
}

@end
