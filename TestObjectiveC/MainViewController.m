//
//  MainViewController.m
//  TestObjectiveC
//
//  Created by Kenneth Siu on 9/21/13.
//  Copyright (c) 2013 Kenneth Siu. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        TestMainView *viewCont = [[TestMainView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
        
        self.view = viewCont;
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

@end
