//
//  SHTBalloonController.h
//  spritekit-shooter
//
//  Created by Simon Racz on 13/04/14.
//  Copyright (c) 2014 Simon Racz. All rights reserved.
//

@import Foundation;
@import SpriteKit;

@interface SHTBalloonController : NSObject

@property (nonatomic) SKNode* view;
@property (nonatomic, getter = isPaused) BOOL paused;

@end
