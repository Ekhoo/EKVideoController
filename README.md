# EKVideoController
Light weight view controller which add a video as a full screen background for IOS written in Objective-C.

### Demonstration
![EKVideoController](https://github.com/Ekhoo/EKVideoController/blob/dev/EKVideoControllerExample/Ressources/Videos/Demonstration.gif)

### Features
- You can set a video as a full screen background of your view controller.
- You can set a repeat mode.
- You can add a mask to the video.
- You can handle the speed of the video.
- You can play, stop, pause and restart the video.

### Usage
- Inherit your `ViewController` by `EKVideoController`.
- In `ViewDidLoad` or `LoadView` method, set `videoPath`. It can be a local path, or an url.
- Then, call `play`.
- Enjoy :)

### Example
``` objective-c
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.videoPath     = [[NSBundle mainBundle] pathForResource:@"Video" ofType:@"mp4"];
    self.repeat        = YES;
    self.maskTintColor = [UIColor blackColor];
    self.maskAlpha     = 0.5f;
    
    [self play];
}
```

### Contact
- [contact@lucas-ortis.com](contact@lucas-ortis.com)
- [Facebook](https://www.facebook.com/lucasekhoo.ortis)
- [Linkedin](https://www.linkedin.com/profile/view?id=124705168)
- [Twitter](https://twitter.com/LucasEkhoo)

### Lisence
EKVideoController is available under the MIT license. See the LICENSE file for more info.
