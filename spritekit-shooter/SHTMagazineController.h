//
//  SHTMagazineController.h
//  spritekit-shooter
//
//  Created by Simon Racz on 16/03/14.
//  Copyright (c) 2014 Simon Racz. All rights reserved.
//

@import Foundation;
@import SpriteKit;

@interface SHTMagazineController : NSObject

@property (nonatomic, strong) SKNode* view;

- (BOOL) canShoot; //returns whether shooting is enabled
- (BOOL) shoot; //returns whether shooting is enabled
- (void) reset; //resets all states, e.g. removes all actions, fills the magazine

@end
