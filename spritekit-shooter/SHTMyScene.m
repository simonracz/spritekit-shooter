//
//  SHTMyScene.m
//  spritekit-shooter
//
//  Created by Simon Racz on 15/03/14.
//  Copyright (c) 2014 Simon Racz. All rights reserved.
//

#import "SHTMyScene.h"

@implementation SHTMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
		SKTexture *backgroundTexture = [SKTexture textureWithImageNamed:@"bg.png"];
		SKSpriteNode *background = [SKSpriteNode spriteNodeWithTexture:backgroundTexture size:self.frame.size];
		background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
		
		[self addChild:background];
		
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = @"Hello, World!";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:myLabel];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
		NSString *gunSmokePath = [[NSBundle mainBundle] pathForResource:@"GunSmoke" ofType:@"sks"];
		SKEmitterNode *emitter = [NSKeyedUnarchiver unarchiveObjectWithFile:gunSmokePath];

		emitter.position = location;
		
		CGFloat seconds = emitter.numParticlesToEmit / emitter.particleBirthRate + emitter.particleLifetime + emitter.particleLifetimeRange / 2;
		
        SKAction *action = [SKAction sequence: @[[SKAction waitForDuration:seconds], [SKAction removeFromParent]]];
        
        [emitter runAction:action];
		
		[self addChild:emitter];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
