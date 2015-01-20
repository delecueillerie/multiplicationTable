//
//  storageEngine.m
//  multiplicationTable
//
//  Created by Olivier Delecueillerie on 23/12/2014.
//  Copyright (c) 2014 lagspoon. All rights reserved.
//

#import "storageEngine.h"




#define USERLASTPLAYDIC @"userLastPlayDictionary"
#define USERS @"users"
#define TESTHISTORICAL @"testHistorical"



@interface storageEngine ()

@property (strong, nonatomic) NSDictionary *userLastPlayDictionary;
@property (strong, nonatomic) NSArray *users;
@property (strong, nonatomic) NSDictionary *testHistorical;
@end




@implementation storageEngine



+ (storageEngine*)sharedInstance
{
    static storageEngine *_sharedInstance = nil;
    
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[storageEngine alloc] init];
        
    });
    return _sharedInstance;
}

/*/////////////////////////////////////////////////////////////////////////////////////
 ACCESSORS
/////////////////////////////////////////////////////////////////////////////////////*/

-(NSArray *) users {
    if (!_users) {
        _users = [[NSUserDefaults standardUserDefaults] arrayForKey:USERS];
        if (!_users)
        {
            _users = [[NSArray alloc] init];
        }
    }
    return _users;
}


-(NSDictionary *) userLastPlayDictionary {
    if (!_userLastPlayDictionary) {
        _userLastPlayDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:USERLASTPLAYDIC];
        if (!_userLastPlayDictionary)
        {
            _userLastPlayDictionary = [[NSDictionary alloc] init];
        }
    }
    return _userLastPlayDictionary;
}


-(NSDictionary *) testHistorical {
    if (!_testHistorical) {
        _testHistorical = [[NSUserDefaults standardUserDefaults] dictionaryForKey:TESTHISTORICAL];
        if (!_testHistorical)
        {
            _testHistorical = [[NSDictionary alloc] init];
        }
    }
    return _testHistorical;
}


@end
