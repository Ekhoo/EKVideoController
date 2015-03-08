//
//  EKVideoController.h
//  EKVideoControllerExample
//
//  Created by Lucas Ortis on 06/03/2015.
//  Copyright (c) 2015 Ekhoo. All rights reserved.
//

#import <UIKit/UIKit.h>

#define EK_SCREEN_BOUNDS [[UIScreen mainScreen] bounds]
#define EK_SCREEN_WIDTH  [[[UIScreen mainScreen] bounds] width]
#define EK_SCREEN_HEIGHT [[[UIScreen mainScreen] bounds] height]

@interface EKVideoController : UIViewController

//
//  VideoPath can be a local file path or an URL.
//  When it's setted, the view controller initialize and add the video to the view.
//
@property(nonatomic, strong) NSString *videoPath;

//
//  Determine how the view controller repeats the playback of the video.
//  Default value is YES.
//
@property(nonatomic, assign) BOOL repeat;

//
//  Determine the speed of the video.
//  Default value is 1.0f;
//
@property(nonatomic, assign) CGFloat videoSpeed;

//
//  Determine the mask color.
//  Default value is [UIColor clearColor].
//
@property(nonatomic, strong) UIColor *maskTintColor;

//
//  Determine the transparency of the mask.
//  Default value is 0.0f.
//
@property(nonatomic, assign) CGFloat maskAlpha;

//
//  Play the video.
//
- (void)play;

//
//  Stop the video.
//
- (void)stop;

//
//  Pause the video.
//
- (void)pause;

//
//  Restart the video from the beginning.
//
- (void)restart;

@end
