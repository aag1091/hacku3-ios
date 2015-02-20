//
//  HomeTableCell.m
//  Hackathon
//
//  Created by Raghav Sai on 2/12/15.
//  Copyright (c) 2015 handson. All rights reserved.
//

#import "CategoryCell.h"

@interface CategoryCell ()


@end


@implementation CategoryCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma design UI
- (void)designUI:(NSInteger)category
{
    self.lblEventTitle.textColor = [UIColor colorWithRed:52/255.0f green:73/255.0f blue:94/255.0f alpha:1.0];
    self.lblCount.text = @"100";
    if(category == 1)
    {
        [self designSportsCategory];
    }
    else if (category == 2)
    {
        [self designEducationCategory];
    }
    else if (category == 3)
    {
        [self designGreekCategory];
    }
    else if (category == 4)
    {
        [self designEntertainmentCategory];
    }
    else if (category == 5)
    {
        [self designOtherCategory];
    }
}



- (void)prepareCellForTabelView:(UITableView *)tableView atIndex:(NSIndexPath *)indexPath atEvent:(Events *)event forCell:(CategoryCell *) cell
{
    cell.lblEventTitle.text = event.eventTitle;
    cell.lblCount.text = event.attendeeLimit;
    cell.lblVenue.text = event.eventLocation;
    cell.lblDateOfEvent.text = event.eventTime;
    cell.categoryId = event.categoryId;
    cell.eventId = event.eventId;
    cell.eventDescription = event.eventDescription;
    cell.btnJoin.tag = indexPath.section;
    cell.joinState = event.joinState;
}

#pragma design categories

- (void)designSportsCategory
{
    
    if(self.joinState==YES)
    {
        [self.btnJoin   setTitle:@"Joined" forState:normal];
        self.btnJoin.backgroundColor =[UIColor colorWithRed:46.0/255.0f green:204.0/255.0f blue:113.0/255.0f alpha:1.0];
        [self.btnJoin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    else{
        self.btnJoin.layer.borderColor = [[UIColor colorWithRed:231/255.0f green:76.0/255.0f blue:60.0/255.0f alpha:1.0]CGColor];
    }
    
    
    self.attendersView.backgroundColor = [UIColor colorWithRed:231/255.0f green:76.0/255.0f blue:60.0/255.0f alpha:1.0];
    self.imgCategoryView.image = [UIImage imageNamed:@"football_colored.png"];
    self.imgHumanIcon.image = [UIImage imageNamed:@"person.png"];
    //self.imgHumanIcon.backgroundColor = [UIColor colorWithRed:231/255.0f green:76.0/255.0f blue:60.0/255.0f alpha:1.0];
    self.btnJoin.layer.borderWidth = 1.0f;
    self.btnJoin.layer.cornerRadius = 5.0f;
}

- (void)designEducationCategory
{
   
    
    if(self.joinState==YES)
    {
        [self.btnJoin   setTitle:@"Joined" forState:normal];
       self.btnJoin.backgroundColor =[UIColor colorWithRed:46.0/255.0f green:204.0/255.0f blue:113.0/255.0f alpha:1.0];
        [self.btnJoin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    else{
        self.btnJoin.layer.borderColor = [[UIColor colorWithRed:231/255.0f green:76.0/255.0f blue:60.0/255.0f alpha:1.0]CGColor];
    }
    
    
    
    self.attendersView.backgroundColor = [UIColor colorWithRed:241/255.0f green:196.0/255.0f blue:15.0/255.0f alpha:1.0];
    self.imgCategoryView.image = [UIImage imageNamed:@"school_colored.png"];
    self.imgHumanIcon.image = [UIImage imageNamed:@"person.png"];
    //self.imgHumanIcon.backgroundColor = [UIColor colorWithRed:241/255.0f green:196.0/255.0f blue:15.0/255.0f alpha:1.0];
    self.btnJoin.layer.borderWidth = 1.0f;
    self.btnJoin.layer.cornerRadius = 5.0f;
}

- (void)designGreekCategory
{
   
    
    if(self.joinState==YES)
    {
        [self.btnJoin   setTitle:@"Joined" forState:normal];
        self.btnJoin.backgroundColor =[UIColor colorWithRed:46.0/255.0f green:204.0/255.0f blue:113.0/255.0f alpha:1.0];        [self.btnJoin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    else{
        self.btnJoin.layer.borderColor = [[UIColor colorWithRed:231/255.0f green:76.0/255.0f blue:60.0/255.0f alpha:1.0]CGColor];
    }
    
    
    self.attendersView.backgroundColor = [UIColor colorWithRed:52/255.0f green:152.0/255.0f blue:219.0/255.0f alpha:1.0];
    self.imgCategoryView.image = [UIImage imageNamed:@"greek_colored.png"];
    self.imgHumanIcon.image = [UIImage imageNamed:@"person.png"];
    //self.imgHumanIcon.backgroundColor = [UIColor colorWithRed:52/255.0f green:152.0/255.0f blue:219.0/255.0f alpha:1.0];
    self.btnJoin.layer.borderWidth = 1.0f;
    self.btnJoin.layer.cornerRadius = 5.0f;
}

- (void)designEntertainmentCategory
{
   
    
    
    if(self.joinState==YES)
    {
        [self.btnJoin   setTitle:@"Joined" forState:normal];
        self.btnJoin.backgroundColor =[UIColor colorWithRed:46.0/255.0f green:204.0/255.0f blue:113.0/255.0f alpha:1.0];
        [self.btnJoin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    else{
        self.btnJoin.layer.borderColor = [[UIColor colorWithRed:231/255.0f green:76.0/255.0f blue:60.0/255.0f alpha:1.0]CGColor];
    }
    
    
    self.btnJoin.layer.borderColor = [[UIColor colorWithRed:46/255.0f green:204.0/255.0f blue:113.0/255.0f alpha:1.0]CGColor];
    self.attendersView.backgroundColor = [UIColor colorWithRed:46/255.0f green:204.0/255.0f blue:113.0/255.0f alpha:1.0];
    self.imgCategoryView.image = [UIImage imageNamed:@"movie_colored.png"];
    self.imgHumanIcon.image = [UIImage imageNamed:@"person.png"];
    //self.imgHumanIcon.backgroundColor = [UIColor colorWithRed:46/255.0f green:204.0/255.0f blue:113.0/255.0f alpha:1.0];
    self.btnJoin.layer.borderWidth = 1.0f;
    self.btnJoin.layer.cornerRadius = 5.0f;
}

- (void)designOtherCategory
{
    
    if(self.joinState==YES)
    {
        [self.btnJoin   setTitle:@"Joined" forState:normal];
        self.btnJoin.backgroundColor =[UIColor colorWithRed:46.0/255.0f green:204.0/255.0f blue:113.0/255.0f alpha:1.0];
        [self.btnJoin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    else{
        self.btnJoin.layer.borderColor = [[UIColor colorWithRed:231/255.0f green:76.0/255.0f blue:60.0/255.0f alpha:1.0]CGColor];
    }    self.attendersView.backgroundColor = [UIColor colorWithRed:155/255.0f green:89/255.0f blue:182/255.0f alpha:1.0];
    self.imgCategoryView.image = [UIImage imageNamed:@"other_colored.png"];
    self.imgHumanIcon.image = [UIImage imageNamed:@"person.png"];
    //self.imgHumanIcon.backgroundColor = [UIColor colorWithRed:155/255.0f green:89/255.0f blue:182/255.0f alpha:1.0];
    self.btnJoin.layer.borderWidth = 1.0f;
    self.btnJoin.layer.cornerRadius = 5.0f;
}



@end
