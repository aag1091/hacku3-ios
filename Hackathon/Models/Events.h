//
//  Events.h
//  Hackathon
//
//  Created by handson MacPro on 2/12/15.
//  Copyright (c) 2015 handson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Events : NSObject

+ (Events *)sharedData;

@property (nonatomic,strong) NSString *eventTitle;
@property (nonatomic,strong) NSString *eventDescription;
@property (nonatomic,strong) NSString *eventLocation;
@property (nonatomic,strong) NSString *photoLocation;
@property (nonatomic,strong) NSString *attendeeLimit;
@property (nonatomic, strong) NSUserDefaults *defaults;
@property (nonatomic,strong) NSMutableArray *topEvents;
@property (nonatomic,strong) NSMutableArray *categoryAllEvents;
@property (nonatomic,strong) NSString *categoryId;
@property (nonatomic,strong) NSString *eventTime;
@property (nonatomic,strong) NSString *selectedCategoryId;
@property (nonatomic,strong) NSString *selectedCategorayStatus;
@property (nonatomic,strong) NSString *eventId;
@property  BOOL joinState;



-(void) saveEventData:(NSDictionary *) responseData;
-(void) saveCategoryEventData:(NSDictionary *) responseData;

@end
