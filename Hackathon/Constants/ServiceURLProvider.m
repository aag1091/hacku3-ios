//
//  ServiceURLProvider.m
//  Qwyvr
//
//  Created by ravi pitapurapu on 9/13/14.
//  Copyright (c) 2014 Qwyvr. All rights reserved.
//

#import "ServiceURLProvider.h"

#define base_url @"http://188.166.10.235/api/"

@interface ServiceURLProvider ()


@end

@implementation ServiceURLProvider

+(NSString *)getURLForServiceWithKey:(NSString *)key
{
    NSString *returnString = [NSString stringWithFormat:@"%@%@",base_url,key];
    return returnString;
}

@end
