//
//  SHTPauseDialogViewController.h
//  spritekit-shooter
//
//  Created by Simon Racz on 17/03/14.
//  Copyright (c) 2014 Simon Racz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SHTPauseDialogDelegate;

@interface SHTPauseDialogViewController : UIViewController
@property (nonatomic, weak) id<SHTPauseDialogDelegate> resumeDelegate;
@end

@protocol SHTPauseDialogDelegate <NSObject>
- (void) pauseDialogResumeDidPressed:(SHTPauseDialogViewController*) pauseDialogViewController;
@end

