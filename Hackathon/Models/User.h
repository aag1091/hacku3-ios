//
//  User.h
//  Hackathon
//
//  Created by handson MacPro on 2/12/15.
//  Copyright (c) 2015 handson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSUserDefaults *defaults;
@property (nonatomic, strong) NSString *userId;


+ (User *)user;



@end
