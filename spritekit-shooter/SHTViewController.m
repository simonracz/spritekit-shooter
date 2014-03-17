//
//  SHTViewController.m
//  spritekit-shooter
//
//  Created by Simon Racz on 15/03/14.
//  Copyright (c) 2014 Simon Racz. All rights reserved.
//

#import "SHTViewController.h"
#import "SHTMyScene.h"

@interface SHTViewController ()
@property (weak, nonatomic) IBOutlet UIView *pauseDialog;
@property (weak, nonatomic) IBOutlet UIButton *outerPauseView;

@end

@implementation SHTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	[[UIApplication sharedApplication] setStatusBarHidden:YES];
	self.outerPauseView.hidden = YES;
}

- (void)viewWillLayoutSubviews
{
	[super viewWillLayoutSubviews];
	
	SKView * skView = (SKView *)self.view;
	if (!skView.scene) {
		skView.showsFPS = YES;
		skView.showsNodeCount = YES;
		
		// Create and configure the scene.
		SKScene * scene = [SHTMyScene sceneWithSize:skView.bounds.size];
		scene.scaleMode = SKSceneScaleModeAspectFill;
		
		// Present the scene.
		[skView presentScene:scene];
	}
}

- (void) pauseDialogResumeDidPressed:(SHTPauseDialogViewController *)pauseDialogViewController
{
	self.outerPauseView.hidden = YES;
	SKView* skView = (SKView *)self.view;
	skView.paused = NO;
}

- (IBAction)pauseButtonClicked:(UIButton *)sender
{
	SKView* skView = (SKView *)self.view;
	skView.paused = YES;
	self.outerPauseView.hidden = NO;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([[segue identifier] isEqualToString:@"pauseSegue"]) {
		SHTPauseDialogViewController* dvc = (SHTPauseDialogViewController*) segue.destinationViewController;
		dvc.resumeDelegate = self;
	}
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
