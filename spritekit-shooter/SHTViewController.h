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

- (IBAction)pauseButtonClicked:(UIButton *)sender;

@end
