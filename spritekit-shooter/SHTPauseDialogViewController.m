//
//  SHTPauseDialogViewController.m
//  spritekit-shooter
//
//  Created by Simon Racz on 17/03/14.
//  Copyright (c) 2014 Simon Racz. All rights reserved.
//

#import "SHTPauseDialogViewController.h"

@interface SHTPauseDialogViewController ()

@end

@implementation SHTPauseDialogViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)resumeClicked:(UIButton *)sender {	
	[self.resumeDelegate pauseDialogResumeDidPressed:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
