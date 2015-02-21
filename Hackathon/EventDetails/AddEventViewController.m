//
//  AddEventViewController.m
//  Hackathon
//
//  Created by Raghav Sai on 2/13/15.
//  Copyright (c) 2015 handson. All rights reserved.
//

#import "AddEventViewController.h"
#import "IQDropDownTextField.h"
#import "ServiceManager.h"
#import "ServiceURLProvider.h"


@interface AddEventViewController ()<UITextFieldDelegate,UITextViewDelegate,ServiceProtocol>

@property (weak, nonatomic) IBOutlet UITextField *txtEventTitle;
@property (weak, nonatomic) IBOutlet IQDropDownTextField *categoryPicker;
@property (weak, nonatomic) IBOutlet IQDropDownTextField *datePicker;
@property (weak, nonatomic) IBOutlet UITextView *txtDescriptionView;
@property (weak, nonatomic) IBOutlet UIButton *btnCheckBox;
@property (weak, nonatomic) IBOutlet UIView *attendeeView;
@property (weak, nonatomic) IBOutlet UITextField *txtAttendeeCount;
@property (strong, nonatomic) IBOutlet UITextField *txtLocation;
@property (strong, nonatomic) IBOutlet UIScrollView *eventScrollView;
@property (nonatomic,strong) ServiceManager *manager;



@property (nonatomic,strong) NSMutableArray *categoryArray;
@property BOOL checkbox;
@property (nonatomic,assign) CGFloat  keyboardHeight;
@property (nonatomic,assign) CGPoint priorOriginOfTextView;


@end

@implementation AddEventViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.manager = [ServiceManager defaultManager];
    self.manager.serviceDelegate = self;
    [self designUI];
}

#pragma design UI

- (void)designUI
{
    self.txtEventTitle.delegate = self;
    self.txtAttendeeCount.delegate = self;
    self.txtLocation.delegate = self;
    self.txtDescriptionView.delegate = self;
    self.checkbox = YES;
    [self.btnCheckBox setImage:[UIImage imageNamed:@"checked_checkbox.png"] forState:UIControlStateNormal];
    [self prepareSourcePicker];
    [self prepareCategoryData];
    [self prepareDatePicker];
}

-(void) setScrollView
{
    [self.eventScrollView setScrollEnabled:YES];
    [self.eventScrollView  setContentSize:CGSizeMake(self.view.frame.size.width,self.view.frame.size.height)];
}

- (void)prepareSourcePicker
{
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar setBarStyle:UIBarStyleBlackTranslucent];
    [toolbar sizeToFit];
    UIBarButtonItem *buttonflexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *buttonDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneClicked:)];
    
    [toolbar setItems:[NSArray arrayWithObjects:buttonflexible,buttonDone, nil]];
    
    self.datePicker.inputAccessoryView = toolbar;
    self.categoryPicker.inputAccessoryView = toolbar;
    self.txtDescriptionView.inputAccessoryView = toolbar;
    self.txtAttendeeCount.inputAccessoryView = toolbar;
}

- (void)prepareCategoryData
{
    self.categoryPicker.isOptionalDropDown = NO;
    self.categoryArray = [[NSMutableArray alloc]init];
    [self.categoryArray addObject:@"Sports"];
    [self.categoryArray addObject:@"Education"];
    [self.categoryArray addObject:@"Greek"];
    [self.categoryArray addObject:@"Entertainment"];
    [self.categoryArray addObject:@"Other"];
    [self.categoryPicker setItemList:self.categoryArray];
    
}

- (void)prepareDatePicker
{
    self.datePicker.isOptionalDropDown = NO;
    self.datePicker.dropDownMode = IQDropDownModeDatePicker;
    self.datePicker.datePickerMode = UIDatePickerModeDateAndTime;
}



#pragma utility methods
- (void)doneClicked:(id)sender
{
    [self.view endEditing:YES];
}



- (IBAction)checkBoxAction:(id)sender
{
    if (!self.checkbox) {
        [self.btnCheckBox setImage:[UIImage imageNamed:@"checked_checkbox.png"] forState:UIControlStateNormal];
        self.checkbox = YES;
        self.attendeeView.hidden = YES;
    }
    
    else if (self.checkbox) {
        [self.btnCheckBox setImage:[UIImage imageNamed:@"unchecked_checkbox.png"] forState:UIControlStateNormal];
        self.checkbox = NO;
        self.attendeeView.hidden = NO;
    }
}

- (void)serviceCallCompletedWithResponseObject:(id)response
{
    
    UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Successfully Created Event"
                                                     message:@"ok"
                                                    delegate:self
                                           cancelButtonTitle:@"ok"
                                           otherButtonTitles: nil];
    [alert addButtonWithTitle:@"GOO"];
    [alert show];
    
}

- (void)serviceCallCompletedWithError:(NSError *)error
{
    NSLog(@"%@",error.description);
}




- (IBAction)createEvent:(id)sender
{
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:@"6" forKey:@"user_id"];
    
     [parameters setObject:self.txtEventTitle.text forKey:@"title"];
    
    [parameters setObject:self.txtDescriptionView.text forKey:@"description"];
    [parameters setObject:self.txtLocation.text forKey:@"location"];
    [parameters setObject:self.categoryPicker.selectedItem forKey:@"category_id"];
    [parameters setObject:self.datePicker.selectedItem forKey:@"time"];
    [parameters setObject:self.txtAttendeeCount.text forKey:@"attendee_limit"];
    
    NSString *url = @"http://188.166.10.235/api/events/add";
    
    
    
    // NSMutableString *stringUrl = [[NSMutableString alloc] init];
    
    [self.manager serviceCallWithURL:url andParameters:parameters];
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
