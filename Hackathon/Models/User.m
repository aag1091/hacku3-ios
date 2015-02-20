//
//  User.m
//  Hackathon
//
//  Created by handson MacPro on 2/12/15.
//  Copyright (c) 2015 handson. All rights reserved.
//

#import "User.h"

@implementation User

+ (User *)user
{
    static User *user;
    @synchronized(self)
    {
        if (!user)
            user = [[User alloc]init];
        return user;
    }
    
}

- (NSUserDefaults *)defaults
{
    if(!_defaults)
        _defaults = [NSUserDefaults standardUserDefaults];
    
    return _defaults;
}

- (NSString *)userId
{
    if(!_userId)
    {
        NSString *uid = [self.defaults stringForKey:@"userId"];
        if(uid)
            _userId = uid;
    }
    
    return _userId;
}

- (void)saveUserId:(NSString *)userAddressId
{
    [self.defaults setObject:userAddressId forKey:@"userId"];
    self.userId = userAddressId;
    
}

@end
