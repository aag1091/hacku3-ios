//
//  ViewController.m
//  Hackathon
//
//  Created by Raghav Sai on 2/12/15.
//  Copyright (c) 2015 handson. All rights reserved.
//

#import "LoginViewController.h"
#import "ServiceManager.h"
#import "ServiceURLProvider.h"
#import "HomeTabController.h"

@interface LoginViewController ()<ServiceProtocol>

@property (weak, nonatomic) IBOutlet UITextField *txtFieldUserName;

@property (weak, nonatomic) IBOutlet UITextField *txtFieldPassword;
@property (weak, nonatomic) IBOutlet UIImageView *imgLogo;
@property (nonatomic,strong) ServiceManager *manager;
@property (nonatomic,strong) UIStoryboard *storyBoard;
@property (nonatomic,strong) HomeTabController *homeTabController;

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.manager = [ServiceManager defaultManager];
    self.manager.serviceDelegate = self;
    self.storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];


    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginTapped:(id)sender
{
    
    if([self.txtFieldPassword.text isEqualToString:@""] || [self.txtFieldUserName.text isEqualToString:@""])
    {
        UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Invalid Credentials"
                                                         message:@"Please Provide Valid credentials"
                                                        delegate:self
                                               cancelButtonTitle:@"ok"
                                               otherButtonTitles: nil];
        [alert addButtonWithTitle:@"GOO"];
        [alert show];
    }
    
    else
        [self performLogin];
    
    
}

-(void) performLogin
{
    NSMutableDictionary *parameters = [self getUserLoginData];
    NSString *url = [ServiceURLProvider getURLForServiceWithKey:@"login"];
   // [self.manager postRequestCallWihURL:url andParameters:parameters];
    
    [self.manager postRequestCallWithURL:url andParameters:parameters];
}


-(NSMutableDictionary *) getUserLoginData
{
    NSMutableDictionary *parameters =[[NSMutableDictionary alloc] init];
    [parameters setObject:self.txtFieldUserName.text  forKey:@"email"];
    [parameters setObject:self.txtFieldPassword.text  forKey:@"password"];
    return parameters;
}

#pragma mark - ServiceProtocol Methods

- (void)serviceCallCompletedWithResponseObject:(id)response
{
    NSDictionary *reponse = (NSMutableDictionary *)response;
    NSString *suc = [reponse objectForKey:@"success"];
    
    if([suc intValue] == 1)
    {
        self.homeTabController = [self.storyBoard instantiateViewControllerWithIdentifier:@"HomeTabController"];
         [self.navigationController pushViewController:self.homeTabController animated:YES];
        
    }
    else
    {
        
    }
    
}
- (void)serviceCallCompletedWithError:(NSError *)error
{
    NSLog(@"%@",error.description);
}
@end
