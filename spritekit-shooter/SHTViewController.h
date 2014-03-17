//
//  SHTViewController.h
//  spritekit-shooter
//

//  Copyright (c) 2014 Simon Racz. All rights reserved.
//

@import UIKit;
@import SpriteKit;

#import "SHTPauseDialogViewController.h"

@interface SHTViewController : UIViewController<SHTPauseDialogDelegate>
@property (nonatomic, getter = isPaused) BOOL paused;
@end
