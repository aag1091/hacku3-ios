//
//  HomeViewController.m
//  Hackathon
//
//  Created by Raghav Sai on 2/12/15.
//  Copyright (c) 2015 handson. All rights reserved.
//

#import "HomeViewController.h"
#import "CategoryCell.h"
#import "ServiceManager.h"
#import "ServiceURLProvider.h"
#import "Events.h"
#import "CategoryEventsTableTableViewController.h"
#import "EventDetailTableViewController.h"

@interface HomeViewController () <ServiceProtocol>

@property (weak, nonatomic) IBOutlet UITableView *topCategoryTableView;
@property (nonatomic,strong) ServiceManager *manager;
@property (nonatomic,strong) Events *events;
@property (nonatomic,strong) UIStoryboard *storyBoard;
@property (nonatomic,strong) NSString *categoryClicked;
@property (nonatomic,strong) CategoryEventsTableTableViewController *categoryEventsTableTableViewController;
@property (strong, nonatomic) EventDetailTableViewController *eventDetailTableViewController;
@property BOOL isJoin;
@property (strong,nonatomic) NSIndexPath *selectedIndex;
@property (strong,nonatomic) CategoryCell *catergoryCell;
@end

@implementation HomeViewController

-(void) awakeFromNib
{
     //[self getEventLists];
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.manager = [ServiceManager defaultManager];
    self.manager.serviceDelegate = self;
    self.storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    // Do any additional setup after loading the view.
    self.topCategoryTableView.rowHeight = 110.0f;
    [self getEventLists];
    self.navigationController.navigationItem.backBarButtonItem.enabled = NO;
    self.navigationItem.hidesBackButton = YES;    
}
-(void) viewWillAppear:(BOOL)animated
{
   self.manager.serviceDelegate = self;
}

- (Events *)events
{
    if(!_events)
        _events = [Events sharedData];
    
    return _events;
}

-(void) getEventLists
{
    NSString *url;
    url = [ServiceURLProvider getURLForServiceWithKey:kGetEventsServiceKey];
    [self.manager getRequestCallWithURL:url];
    //[self.manager getRequestCallWithURL:<#(NSString *)#>]
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma tableview delegates and data sources

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   
    if(self.events.topEvents==nil)
        return 0;
    else
       return self.events.topEvents.count;
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CategoryCell";
    CategoryCell *cell = (CategoryCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    [cell designUI:1];
    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
   if(self.events.topEvents.count>0)
   {
        [cell prepareCellForTabelView:tableView atIndex:indexPath atEvent:self.events.topEvents[indexPath.section] forCell:cell];
   }
   
    
    if(indexPath.section == 0)
    {
        [cell designUI:1];
        
    }

    else if(indexPath.section == 1)
    {
          [cell designUI:2];
    }
   else  if(indexPath.section == 2)
    {
         [cell designUI:3];
        cell.backgroundColor = [UIColor whiteColor];
        
    }
   else  if(indexPath.section == 3)
   {
         [cell designUI:4];
   }
    
   else  if(indexPath.section == 4)
   {
         [cell designUI:5];
       
   }
   cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 5.0f;
    return cell;
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
   
    
    
    if([self.events.selectedCategorayStatus isEqualToString:@"YES"])
   {
      [self.events saveCategoryEventData:response];
       
       
       self.categoryEventsTableTableViewController = (CategoryEventsTableTableViewController *) [self.storyBoard instantiateViewControllerWithIdentifier:@"CategoryEventsTableTableViewController"];
       self.categoryEventsTableTableViewController.categoryId= [[NSString alloc] initWithString:self.events.selectedCategoryId];
       [self.navigationController pushViewController:self.categoryEventsTableTableViewController animated:YES];
   }
    
    else
    {
        if(self.isJoin == YES)
        {
            self.isJoin=NO;
           
            //[self.catergoryCell.btnJoin setTitle@"Joined" forState: UIControlState.Normal];
            UIButton *clickedButton = self.catergoryCell.btnJoin;
           
            if(self.catergoryCell.joinState==YES)
            {
                [clickedButton setTitle:@"Joined" forState:normal];
                clickedButton.backgroundColor =[UIColor colorWithRed:46.0/255.0f green:204.0/255.0f blue:113.0/255.0f alpha:1.0];
                [clickedButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                 [self toggleMyBOOL];
            }
            else
            {
                self.catergoryCell.joinState=NO;
                [clickedButton setTitle:@"Join" forState:normal];
                 self.catergoryCell.btnJoin.backgroundColor =[UIColor whiteColor];
                [clickedButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
                 clickedButton.layer.borderColor = [[UIColor colorWithRed:231/255.0f green:76.0/255.0f blue:60.0/255.0f alpha:1.0]CGColor];
                 [self toggleMyBOOL];
                //[self.catergoryCell designUI:[self.catergoryCell.categoryId integerValue]];
            }
            
            
        }
        else{
            [self.events saveEventData:response];
            [self.topCategoryTableView reloadData];
        }
    }
    
}
- (void) toggleMyBOOL {
    self.self.catergoryCell.joinState = !self.self.catergoryCell.joinState;
}
- (void)serviceCallCompletedWithError:(NSError *)error
{
    NSLog(@"%@",error.description);
}

- (IBAction)joinTapped:(id)sender
{
    self.isJoin = YES;
    UIButton *buttons=sender;
    
    NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:buttons.tag];
    
    self.catergoryCell = (CategoryCell *)[self.topCategoryTableView cellForRowAtIndexPath:path];

    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:@"6" forKey:@"user_id"];
    
    NSString *url;
    if(self.catergoryCell.joinState==NO)
        url = @"http://188.166.10.235/api/events/join/";
    else
        url = @"http://188.166.10.235/api/events/unjoin/";
        
    NSString *finalUrl =  [url stringByAppendingFormat:@"%d",[self.catergoryCell.eventId intValue]];
   // NSMutableString *stringUrl = [[NSMutableString alloc] init];
    
    [self.manager serviceCallWithURL:finalUrl andParameters:parameters];
    
}

- (IBAction)clickedSports:(id)sender
{
    self.events.selectedCategoryId =@"1";
   
    [self.manager getRequestCallWithURL:@"http://188.166.10.235/api/events/list?cat=1&user_id=6"];
    self.events.selectedCategorayStatus =@"YES";

    
    
    //[self.categoryEventsTableTableViewController getEventLists];
    
    
}

- (IBAction)clickedEducation:(id)sender
{
    self.events.selectedCategoryId =@"2";
    [self.manager getRequestCallWithURL:@"http://188.166.10.235/api/events/list?cat=2&user_id=6"];
    self.events.selectedCategorayStatus =@"YES";
    
}


- (IBAction)moviesTapped:(id)sender
{
    
    self.events.selectedCategoryId =@"4";
    [self.manager getRequestCallWithURL:@"http://188.166.10.235/api/events/list?cat=3&user_id=6"];
    self.events.selectedCategorayStatus =@"YES";

    
    
}
- (IBAction)othersTapped:(id)sender
{
   
    self.events.selectedCategoryId =@"5";
    [self.manager getRequestCallWithURL:@"http://188.166.10.235/api/events/list?cat=5&user_id=6"];
    self.events.selectedCategorayStatus =@"YES";


}
- (IBAction)greekTapped:(id)sender
{
        self.events.selectedCategoryId =@"3";
    [self.manager getRequestCallWithURL:@"http://188.166.10.235/api/events/list?cat=4&user_id=6"];
    self.events.selectedCategorayStatus =@"YES";

    
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
