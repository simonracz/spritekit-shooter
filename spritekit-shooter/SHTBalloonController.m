//
//  SHTBalloonController.m
//  spritekit-shooter
//
//  Created by Simon Racz on 13/04/14.
//  Copyright (c) 2014 Simon Racz. All rights reserved.
//

#import "SHTBalloonController.h"

@interface SHTBalloonController ()
{
	
}
@property (nonatomic) SKTexture* balloon;
@property (nonatomic) NSArray* balloonColors;
@end

@implementation SHTBalloonController

- (instancetype)init
{
	if (self = [super init]) {
		SKNode* root = [[SKNode alloc] init];
		
		self.balloon = [SKTexture textureWithImageNamed:@"balloon.png"];
			
		self.view = root;
		self.balloonColors = @[[UIColor redColor], [UIColor blueColor], [UIColor purpleColor], [UIColor greenColor], [UIColor yellowColor], [UIColor cyanColor]];
		[self startTimer];
	}
	return self;
}

- (void) setPaused:(BOOL)pause
{
	if (_paused == pause) return;
	
	//set timers
	if (!pause) {
		[self startTimer];
	} else {
		[self stopTimer];
	}
	_paused = pause;
}

-(void) startTimer
{
	[self.view removeActionForKey:@"balloonTimer"];
	double t = 50 + arc4random_uniform(950);
	[self.view runAction:[SKAction sequence:@[[SKAction waitForDuration:t/(double)1000],[SKAction performSelector:@selector(emitBalloon) onTarget:self]]] withKey:@"balloonTimer"];
}

-(void) stopTimer
{
	[self.view removeActionForKey:@"balloonTimer"];
}

-(void) emitBalloon
{
	SKSpriteNode *node = [SKSpriteNode spriteNodeWithTexture:self.balloon size:CGSizeMake(55, 75)];
	int color = arc4random_uniform(self.balloonColors.count);
	node.color = self.balloonColors[color];
	node.colorBlendFactor = 0.8;
	int x = 100 + arc4random_uniform(900);
	node.position = CGPointMake(x, -75);
	[self.view addChild:node];
	[node runAction:[SKAction sequence:@[[SKAction moveToY:1000 duration:3], [SKAction removeFromParent]]]];

	[self startTimer];
}

@end

