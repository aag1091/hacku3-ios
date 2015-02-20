//
//  CategoryTableCellTableViewCell.h
//  Hackathon
//
//  Created by Bharath kongara on 2/12/15.
//  Copyright (c) 2015 handson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Events.h"

@interface CategoryTableCellTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *lblEventTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDateOfEvent;
@property (weak, nonatomic) IBOutlet UILabel *lblVenue;

@property (strong, nonatomic) IBOutlet UIImageView *imgCategoryView;
@property (strong, nonatomic) IBOutlet UILabel *lblCount;
@property (strong, nonatomic) IBOutlet UIView *attendersView;
@property (strong, nonatomic) IBOutlet UIImageView *imgHumanIcon;
@property (weak, nonatomic) IBOutlet UIButton *btnJoin;

@property (weak, nonatomic) NSString  *categoryId;
@property (weak, nonatomic) NSString  *eventId;
@property (weak, nonatomic) NSString  *eventDescription;
@property  BOOL joinState;



- (void)designUI:(NSInteger)category;
- (void)prepareCellForTabelView:(UITableView *)tableView atIndex:(NSIndexPath *)indexPath atEvent:(Events *)event forCell:(CategoryTableCellTableViewCell *) cell;

@end
