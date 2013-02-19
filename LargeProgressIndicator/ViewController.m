//
//  ViewController.m
//  LargeProgressIndicator
//
//  Created by Tom Nys on 19/02/13.
//  Copyright (c) 2013 Tom Nys. All rights reserved.
//

#import "ViewController.h"
#import "LargeProgressView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	LargeProgressView* lpv = [[LargeProgressView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
	lpv.center = self.view.center;
	[self.view addSubview:lpv];
	
	[NSTimer scheduledTimerWithTimeInterval:.25 target:self selector:@selector(updateProgress:) userInfo:lpv repeats:YES];
}

-(void)updateProgress:(NSTimer*)t
{
	LargeProgressView* lpv = t.userInfo;
	lpv.progress = lpv.progress + .01;
	if (lpv.progress > 1.)
		lpv.progress = 0.;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
