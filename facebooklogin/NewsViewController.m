//
//  NewsViewController.m
//  facebooklogin
//
//  Created by Derrick Or on 6/14/14.
//  Copyright (c) 2014 derrickor. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsViewController.h"
#import "MoreViewController.h"

@interface NewsViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation NewsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewLoaded {
    [self.spinner stopAnimating];
    self.scrollView.hidden = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //self.navigationItem.title = @"News Feed";
    
    self.scrollView.hidden = YES;
    [self performSelector:@selector(viewLoaded) withObject:nil afterDelay:2];
    
    //self.navigationController.view.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
