//
//  EventDetailTableViewController.h
//  Hackathon
//
//  Created by handson MacPro on 2/12/15.
//  Copyright (c) 2015 handson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventDetailTableViewController : UITableViewController

@property (nonatomic,strong) NSString *categoryID;
@property (nonatomic,strong) NSString *eventID;

@property (nonatomic,strong) NSString *eventLocation;
@property (nonatomic,strong) NSString *eventDescription;

@end
