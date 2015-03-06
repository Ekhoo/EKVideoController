//
//  EKVideoController.h
//  EKVideoControllerExample
//
//  Created by Lucas Ortis on 06/03/2015.
//  Copyright (c) 2015 Ekhoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKVideoController : UIViewController

//
//  VideoPath can be a local file path or an URL.
//  When it's setted, the view controller initialize and add the video to the view.
//
@property(nonatomic, strong) NSString *videoPath;

//
//  Determines how the view controller repeats the playback of the video.
//  Default value is YES.
//
@property(nonatomic, assign) BOOL repeat;

//
//  Play the video.
//
- (void)play;

@end
