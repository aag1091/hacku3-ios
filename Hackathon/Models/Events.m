//
//  Events.m
//  Hackathon
//
//  Created by handson MacPro on 2/12/15.
//  Copyright (c) 2015 handson. All rights reserved.
//

#import "Events.h"

@implementation Events

+ (Events *)sharedData
{
    static Events *events;
    @synchronized(self)
    {
        if (!events)
            events = [[Events alloc] init];
        return events;
    }

}

- (NSUserDefaults *)defaults
{
    if(!_defaults)
        _defaults = [NSUserDefaults standardUserDefaults];
    
    return _defaults;
}

-(void) saveEventData:(NSDictionary *) responseData
{
        
    NSMutableArray *responseEvents = [responseData objectForKey:@"events"];
    self.topEvents = [[NSMutableArray alloc] init];

    
    for( int i=0;i<responseEvents.count ;i++)
    {
        Events *event=[[Events alloc] init];
        
        NSMutableDictionary *dic=responseEvents[i];
        
        event.attendeeLimit=  [[NSString alloc] initWithString:[dic objectForKey:@"attendee_limit"]];
        event.categoryId  =   [[NSString alloc] initWithString:[dic objectForKey:@"category_id"]];
        event.eventDescription =  [[NSString alloc] initWithString:[dic objectForKey:@"description"]];
        event.eventLocation=  [[NSString alloc] initWithString:[dic objectForKey:@"location"]];
        event.eventTitle=  [[NSString alloc] initWithString:[dic objectForKey:@"title"]];
        event.eventTime = [[NSString alloc] initWithString:[dic objectForKey:@"time"]];
        event.eventId  =  [[NSString alloc] initWithString:[dic objectForKey:@"id"]];
        event.joinState = [dic objectForKey:@"joined"];
        [self.topEvents addObject:event];
    }
    
}
-(void) saveCategoryEventData:(NSDictionary *) responseData
{
    
    NSMutableArray *responseEvents = [responseData objectForKey:@"events"];
    self.categoryAllEvents = [[NSMutableArray alloc] init];
    
    
    for( int i=0;i<responseEvents.count ;i++)
    {
        Events *event=[[Events alloc] init];
        
        NSMutableDictionary *dic=responseEvents[i];
        
        event.attendeeLimit=  [[NSString alloc] initWithString:[dic objectForKey:@"attendee_limit"]];
        event.categoryId  =   [[NSString alloc] initWithString:[dic objectForKey:@"category_id"]];
        event.eventDescription =  [[NSString alloc] initWithString:[dic objectForKey:@"description"]];
        event.eventLocation=  [[NSString alloc] initWithString:[dic objectForKey:@"location"]];
        event.eventTitle=  [[NSString alloc] initWithString:[dic objectForKey:@"title"]];
        event.eventTime = [[NSString alloc] initWithString:[dic objectForKey:@"time"]];
        
        [self.categoryAllEvents addObject:event];
    }
    
}

@end
