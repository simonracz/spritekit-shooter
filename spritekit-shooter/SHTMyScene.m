//
//  SHTMyScene.m
//  spritekit-shooter
//
//  Created by Simon Racz on 15/03/14.
//  Copyright (c) 2014 Simon Racz. All rights reserved.
//

#import "SHTMyScene.h"
#import <AVFoundation/AVFoundation.h>
#import "SHTMagazineController.h"

#define IS_WIDESCREEN ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

@interface SHTMyScene ()
@property (nonatomic) SHTMagazineController* magazineController;
@end

@implementation SHTMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
		SKSpriteNode *background;
		if (IS_WIDESCREEN) {
			SKTexture *backgroundTexture = [SKTexture textureWithImageNamed:@"Background-568h@2x~iphone.png"];
			background = [SKSpriteNode spriteNodeWithTexture:backgroundTexture size:self.frame.size];
		} else {
			background = [SKSpriteNode spriteNodeWithImageNamed:@"Background"];
		}
		background.anchorPoint = CGPointMake(0,0);
		background.position = CGPointMake(0,0);
				
		SHTMagazineController* magazineController = [[SHTMagazineController alloc] init];
		magazineController.delegate = self;
		magazineController.view.position = CGPointMake(CGRectGetMaxX(background.frame) - 96, 0);
		[background addChild:magazineController.view];
		self.magazineController = magazineController;
		
		[self addChild:background];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
	if (![self.magazineController shoot]) {
		[self runAction:[SKAction playSoundFileNamed:@"Empty.wav" waitForCompletion:NO]];
		return;
	}
	
	UITouch* touch = [touches anyObject];
	CGPoint location = [touch locationInNode:self];
	
	NSString *gunSmokePath = [[NSBundle mainBundle] pathForResource:@"GunSmoke" ofType:@"sks"];
	SKEmitterNode *emitter = [NSKeyedUnarchiver unarchiveObjectWithFile:gunSmokePath];

	emitter.position = location;
	emitter.targetNode = self.scene;
	
	CGFloat seconds = emitter.numParticlesToEmit / emitter.particleBirthRate + emitter.particleLifetime + emitter.particleLifetimeRange / 2;
	
	SKAction *action = [SKAction sequence: @[[SKAction waitForDuration:seconds], [SKAction removeFromParent]]];
	[emitter runAction:action];
	
	[self addChild:emitter];
	
	[self runAction:[SKAction playSoundFileNamed:@"GunShot.wav" waitForCompletion:NO]];
}

- (void)ammoLoaded:(int)index
{
	[self runAction:[SKAction playSoundFileNamed:@"Reload.wav" waitForCompletion:NO]];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
