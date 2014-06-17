//
//  LoginViewController.m
//  facebooklogin
//
//  Created by Derrick Or on 6/10/14.
//  Copyright (c) 2014 derrickor. All rights reserved.
//

#import "LoginViewController.h"
#import "NewsViewController.h"

@interface LoginViewController ()

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *password;
@property (assign, nonatomic) CGFloat *signUpPromptVerticalPos;

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
- (IBAction)loginBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIView *textFieldWrapper;
@property (weak, nonatomic) IBOutlet UILabel *signUpPrompt;
@property (weak, nonatomic) IBOutlet UIView *signupPromptWrapper;
@property (weak, nonatomic) IBOutlet UIView *loginFormWrapper;

- (IBAction)onTap:(id)sender;

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.username = @"derrick";
    self.password = @"password";
    self.textFieldWrapper.layer.cornerRadius = 5;
    
    self.loginBtn.hidden = YES;
    
    //TODO: Ask why this doesn't work
    //self.signUpPromptVerticalPos = self.signupPromptWrapper.frame.origin.y;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)login {
    NSString *thisusername = self.usernameField.text;
    NSString *thispassword = self.passwordField.text;
    
    if([thisusername isEqualToString:self.username] && [thispassword isEqualToString:self.password]) {
        NSLog(@"let them in");
        
        //UIViewController *vc = [[NewsViewController alloc] init];
        //vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        //[self presentViewController:vc animated:YES completion:nil];
        
        UIViewController *vc = [[NewsViewController alloc] init];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
        navigationController.modalTransitionStyle = UIModalTransitionStyleCoverVertical; // Rises from below
        
        navigationController.navigationBarHidden = YES;

        [self presentViewController:navigationController animated:YES completion:nil];
    }
    else {
        UIAlertView *errorVIew = [[UIAlertView alloc] initWithTitle:@"Incorrect Password" message:@"The password you entered is incorrect. Please try again." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        [errorVIew show];
        
        [self.loginBtn setTitle:@"Log In" forState:UIControlStateNormal];
        [self.activityIndicator stopAnimating];
    }
}

- (void)willShowKeyboard:(NSNotification *)notification{
    
    //TODO: Find out how to style the "disabled" state for the button
    self.loginBtn.hidden = NO;
    
    NSLog(@"show keyboard");
    
    CGRect frame = self.signupPromptWrapper.frame;
    frame.origin.y = 290;
    self.signupPromptWrapper.frame = frame;
    
    CGRect frame2 = self.loginFormWrapper.frame;
    frame2.origin.y = 40;
    self.loginFormWrapper.frame = frame2;
};
- (void)willHideKeyboard:(NSNotification *)notification{
    NSLog(@"hide keyboard");
    
    CGRect frame = self.signupPromptWrapper.frame;
    frame.origin.y = 400;
    self.signupPromptWrapper.frame = frame;
    
    CGRect frame2 = self.loginFormWrapper.frame;
    frame2.origin.y = 90;
    self.loginFormWrapper.frame = frame2;
};

- (IBAction)loginBtn:(id)sender {
    [self.loginBtn setTitle:@"Logging In" forState:UIControlStateNormal];
    [self.activityIndicator startAnimating];
    
    [self performSelector:@selector(login) withObject:nil afterDelay:1];
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}
@end
