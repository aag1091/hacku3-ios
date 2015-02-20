//
//  ServiceURLProvider.h
//  Qwyvr
//
//  Created by ravi pitapurapu on 9/13/14.
//  Copyright (c) 2014 Qwyvr. All rights reserved.
//

#import <Foundation/Foundation.h>

////////////////////////////////////////////////////////////////////////
//                 Servie page keys                                  //
//////////////////////////////////////////////////////////////////////

#define kGetEventsServiceKey @"events/list?user_id=6"
#define kCategoryEventsKey @"events/list"
#define kTopEventsKey @"events/list?limit=5"
#define kLogin @"login"

////////////////////////////////////////////////////////////////////////
//                 End of Service Page keys                          //
//////////////////////////////////////////////////////////////////////

@interface ServiceURLProvider : NSObject

+(NSString *)getURLForServiceWithKey:(NSString *)key;

@end
