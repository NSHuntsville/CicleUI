//
//  SEDViewController.m
//  CicleUI
//
//  Created by Blackmon, Matthew H CTR (US) on 5/28/13.
//  Copyright (c) 2013 Blackmon, Matthew H. AMRDEC/PPT. All rights reserved.
//

#import "SEDViewController.h"
#import "CicleUI.h"

@interface SEDViewController ()

@end

@implementation SEDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CicleUI* ui = [[CicleUI alloc] initWithFrame:(CGRect){ 10,10, 300, 300 }];
    [self.view addSubview:ui];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
