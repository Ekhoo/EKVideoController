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
        _maskTintColor = [UIColor clearColor];
        _maskAlpha     = 0.0f;
    }
    
    return self;
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

    _moviePlayer              = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:videoPath]];
    _moviePlayer.view.frame   = EK_SCREEN_BOUNDS;
    _moviePlayer.fullscreen   = YES;
    _moviePlayer.controlStyle = MPMovieControlStyleNone;
    _moviePlayer.scalingMode  = MPMovieScalingModeAspectFill;
    _moviePlayer.repeatMode   = self.repeat ? MPMovieRepeatModeOne : MPMovieRepeatModeNone;
    
    /*** Movie player mask ***/
    if (_moviePlayerMask) {
        [_moviePlayerMask removeFromSuperview];
        _moviePlayerMask = nil;
    }
    
    _moviePlayerMask                 = [[UIView alloc] initWithFrame:EK_SCREEN_BOUNDS];
    _moviePlayerMask.alpha           = self.maskAlpha;
    _moviePlayerMask.backgroundColor = self.maskTintColor;
    
    [self.view addSubview:_moviePlayer.view];
    [self.view addSubview:_moviePlayerMask];
    [self.view sendSubviewToBack:_moviePlayer.view];
}

- (void)setRepeat:(BOOL)repeat {
    NSParameterAssert(_moviePlayer);
    
    _repeat = repeat;
    
    _moviePlayer.repeatMode = repeat ? MPMovieRepeatModeOne : MPMovieRepeatModeNone;
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
    NSParameterAssert(_moviePlayer);
    
    [_moviePlayer play];
}

- (void)stop {
    NSParameterAssert(_moviePlayer);
    
    [_moviePlayer stop];
}

- (void)pause {
    NSParameterAssert(_moviePlayer);
    
    [_moviePlayer pause];
}

- (void)restart {
    NSParameterAssert(_moviePlayer);
    
    [_moviePlayer stop];
    [_moviePlayer play];
}

@end
