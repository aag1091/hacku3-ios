//
//  UserCalendarTableViewController.m
//  Hackathon
//
//  Created by Raghav Sai on 2/12/15.
//  Copyright (c) 2015 handson. All rights reserved.
//

#import "UserCalendarTableViewController.h"
#import "CategoryCell.h"
#import "CategoryTableCellTableViewCell.h"



@implementation UserCalendarTableViewController

- (void)viewDidLoad
{
   
    self.tableView.rowHeight = 100.0f;
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    
    
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CategoryTableCellTableViewCell";
    CategoryTableCellTableViewCell *cell = (CategoryTableCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    return cell;
}

@end
