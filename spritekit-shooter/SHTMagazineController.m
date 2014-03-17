//
//  SHTMagazineController.m
//  spritekit-shooter
//
//  Created by Simon Racz on 16/03/14.
//  Copyright (c) 2014 Simon Racz. All rights reserved.
//

#import "SHTMagazineController.h"

@interface SHTMagazineController ()
{
	int numberOfShells;
	int cursor;
}
@property (nonatomic) SKTexture* shellTexture;
@property (nonatomic) SKTexture* emptyShellTexture;
@property (nonatomic) NSArray* nodes;
@end

@implementation SHTMagazineController

- (instancetype)init
{
	if (self = [super init]) {
		cursor = 5;
		numberOfShells = 6;
		SKNode* root = [[SKNode alloc] init];

		self.shellTexture = [SKTexture textureWithImageNamed:@"Slug.png"];
		self.emptyShellTexture = [SKTexture textureWithImageNamed:@"SlugEmpty.png"];
		
		for (int i=0; i<numberOfShells; ++i) {
			SKSpriteNode *node = [SKSpriteNode spriteNodeWithTexture:self.shellTexture size:CGSizeMake(96, 43)];
			node.anchorPoint = CGPointMake(0,0);
			node.position = CGPointMake(0, 15 + i*43);
			
			[root addChild:node];
		}
		
		self.view = root;
		self.nodes = [root children];
	}
	return self;
}

- (BOOL) canShoot
{
	return (cursor>=0);
}

- (void) reload
{
	if (cursor>=5) {
		return;
	}
	
	//play sound
	
	[self.nodes[cursor + 1] setTexture:self.shellTexture];
	++cursor;
}

- (void) timerWithRepeatCount:(int) count
{
	SKAction* timer = [SKAction sequence:@[[SKAction waitForDuration:1.0],[SKAction repeatAction:[SKAction sequence:@[[SKAction performSelector:@selector(reload) onTarget:self],[SKAction waitForDuration:0.2]]] count:count]]];
	[self.view runAction:timer withKey:@"timer"];
}

- (BOOL) shoot
{
	if (cursor<0) {
		[self timerWithRepeatCount:(5-cursor)];
		return NO;
	}
	
	[self.nodes[cursor] setTexture:self.emptyShellTexture];
	--cursor;
	
	[self timerWithRepeatCount:(5-cursor)];
	
	return YES;
}

- (void) reset
{
	[self.view removeActionForKey:@"timer"];
	
	while (cursor<5) {
		[self.nodes[cursor + 1] setTexture:self.shellTexture];
		++cursor;
	}
}

@end
