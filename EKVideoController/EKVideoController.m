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

@end

@implementation EKVideoController

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _repeat = YES;
    }
    
    return self;
}

- (void)setVideoPath:(NSString *)videoPath {
    NSParameterAssert(videoPath);
    
    _videoPath = videoPath;
    
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
    
    [self.view addSubview:_moviePlayer.view];
    [self.view sendSubviewToBack:_moviePlayer.view];
}

- (void)setRepeat:(BOOL)repeat {
    NSParameterAssert(_moviePlayer);
    
    _repeat = repeat;
    
    _moviePlayer.repeatMode = repeat ? MPMovieRepeatModeOne : MPMovieRepeatModeNone;
}

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
