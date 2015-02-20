//
//  CategoryEventsTableTableViewController.m
//  Hackathon
//
//  Created by Bharath kongara on 2/12/15.
//  Copyright (c) 2015 handson. All rights reserved.
//

#import "CategoryEventsTableTableViewController.h"
#import "CategoryTableCellTableViewCell.h"
#import "ServiceManager.h"
#import "ServiceURLProvider.h"
#import "Events.h"
#import "EventDetailTableViewController.h"
#import "CategoryCell.h"



@interface CategoryEventsTableTableViewController ()<ServiceProtocol>

@property (nonatomic,strong) ServiceManager *manager;
@property (nonatomic,strong) Events *events;
@property (nonatomic,strong) UIStoryboard *storyBoard;
@property (strong, nonatomic) EventDetailTableViewController *eventDetailTableViewController;



@end

@implementation CategoryEventsTableTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.manager = [ServiceManager defaultManager];
    self.storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    self.tableView.rowHeight = 100.0f;
    
}

-(void) viewWillAppear:(BOOL)animated
{
   // [self getEventLists];
    self.events.selectedCategorayStatus =@"NO";
}

- (Events *)events
{
    if(!_events)
        _events = [Events sharedData];
    
    return _events;
}

-(NSMutableDictionary *) prepareParametersForUserRequests
{
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setValue:self.events.selectedCategoryId forKey:@"cat"];
    return parameters;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    
    if(self.events.categoryAllEvents.count==0)
    {
        self.tableView.tableFooterView = nil;
    }
    return self.events.categoryAllEvents.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CategoryTableCellTableViewCell";
    CategoryTableCellTableViewCell *cell = (CategoryTableCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
   
   
    cell.backgroundColor = [UIColor whiteColor];
    [cell prepareCellForTabelView:tableView atIndex:indexPath atEvent:self.events.topEvents[indexPath.section] forCell:cell];
    if([self.categoryId isEqualToString:@"1"])
    {
         [cell designUI:1];
    }
    else if([self.categoryId isEqualToString:@"2"])
    {
         [cell designUI:2];
    }
    else if([self.categoryId isEqualToString:@"3"])
    {
         [cell designUI:3];
    }
    else if([self.categoryId isEqualToString:@"4"])
    {
         [cell designUI:4];
    }
    else if([self.categoryId isEqualToString:@"5"])
    {
        [cell designUI:5];
    }
    
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 7.0f;
    return cell;
}

- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath
{
    CategoryCell *cell= (CategoryCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    
    if([cell.categoryId isEqualToString:@"1"])
        [self showSportEvent];
    else if ([cell.categoryId isEqualToString:@"2"])
        [self showEducationEvent];
    else if ([cell.categoryId isEqualToString:@"3"])
        [self showGreekEvent];
    else if ([cell.categoryId isEqualToString:@"4"])
        [self showMovieEvent];
    else if ([cell.categoryId isEqualToString:@"5"])
        [self showOtherEvent];
    
}


#pragma event details
-(void)showSportEvent
{
    self.eventDetailTableViewController = [self.storyBoard instantiateViewControllerWithIdentifier:@"EventDetailTableViewController"];
    self.eventDetailTableViewController.categoryID = @"1";
    [self.navigationController pushViewController:self.eventDetailTableViewController animated:YES];
}

-(void)showEducationEvent
{
    self.eventDetailTableViewController = [self.storyBoard instantiateViewControllerWithIdentifier:@"EventDetailTableViewController"];
    self.eventDetailTableViewController.categoryID = @"2";
    [self.navigationController pushViewController:self.eventDetailTableViewController animated:YES];
}

-(void)showGreekEvent
{
    self.eventDetailTableViewController = [self.storyBoard instantiateViewControllerWithIdentifier:@"EventDetailTableViewController"];
    self.eventDetailTableViewController.categoryID = @"3";
    [self.navigationController pushViewController:self.eventDetailTableViewController animated:YES];
}

-(void)showMovieEvent
{
    self.eventDetailTableViewController = [self.storyBoard instantiateViewControllerWithIdentifier:@"EventDetailTableViewController"];
    self.eventDetailTableViewController.categoryID = @"4";
    [self.navigationController pushViewController:self.eventDetailTableViewController animated:YES];
}

-(void)showOtherEvent
{
    self.eventDetailTableViewController = [self.storyBoard instantiateViewControllerWithIdentifier:@"EventDetailTableViewController"];
    self.eventDetailTableViewController.categoryID = @"5";
    [self.navigationController pushViewController:self.eventDetailTableViewController animated:YES];
}


-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    return 8.0;
}
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    
    //Set the background color of the View
    view.tintColor = [UIColor clearColor];
    
    //Set the TextLabel Color
}



#pragma mark - ServiceProtocol Methods

- (void)serviceCallCompletedWithResponseObject:(id)response
{
    [self.events saveCategoryEventData:response];
    [self.tableView reloadData];
}
- (void)serviceCallCompletedWithError:(NSError *)error
{
    NSLog(@"%@",error.description);
}

@end
