//
//  RegisterationControllerViewController.m
//  Hackathon
//
//  Created by ravi pitapurapu on 2/13/15.
//  Copyright (c) 2015 handson. All rights reserved.
//

#import "RegisterationController.h"

@interface RegisterationController ()

@property (weak, nonatomic) IBOutlet UITextField *txtUserName;

@property (weak, nonatomic) IBOutlet UITextField *txtPassword;

@property (weak, nonatomic) IBOutlet UITextField *txtEmail;

@property (nonatomic,strong) ServiceManager *manager;

@end

@implementation RegisterationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)registerTapped:(id)sender
{
    if([self.txtEmail.text isEqualToString:@""] || [self.txtPassword.text isEqualToString:@""]  || [self.txtUserName.text isEqualToString:@""] )
    {
        UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Invalid inputs"
                                                         message:@"Please Provide Valid inputs"
                                                        delegate:self
                                               cancelButtonTitle:@"Cancel"
                                               otherButtonTitles: nil];
        [alert addButtonWithTitle:@"GOO"];
        [alert show];
    }
        
    else
        [self performRegistration];
    
}

-(void) performRegistration
{
    
}


#pragma mark - ServiceProtocol Methods

- (void)serviceCallCompletedWithResponseObject:(id)response
{
    
    
}
- (void)serviceCallCompletedWithError:(NSError *)error
{
    NSLog(@"%@",error.description);
}

@end
