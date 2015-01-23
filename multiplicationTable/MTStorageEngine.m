//
//  storageEngine.m
//  multiplicationTable
//
//  Created by Olivier Delecueillerie on 23/12/2014.
//  Copyright (c) 2014 lagspoon. All rights reserved.
//

#import "MTStorageEngine.h"
#import "MTUser.h"
#import "MTTest.h"


#define USERS @"users"
#define TESTS @"tests"
#define USER_PLAY_HISTORY @"userPlayHistory"
#define TEST_PLAY_HISTORY @"testPlayHistory"



@interface MTStorageEngine ()

@property (strong, nonatomic) NSArray *users;
@property (strong, nonatomic) NSArray *tests;
@property (strong, nonatomic) NSDictionary *userPlayHistoryDictionary;
@property (strong, nonatomic) NSDictionary *testPlayHistoryDictionary;


@property (nonatomic) BOOL testValue;
@end




@implementation MTStorageEngine


@synthesize userPlayHistoryDictionary = _userPlayHistoryDictionary, testPlayHistoryDictionary = _testPlayHistoryDictionary, users = _users, tests = _tests;

+ (MTStorageEngine*)sharedInstance {
    static MTStorageEngine *_sharedInstance = nil;
    
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[MTStorageEngine alloc] init];
        _sharedInstance.testValue = YES;
    });
    return _sharedInstance;
}

#pragma mark - Accessors
-(NSArray *) users {
    if (!_users) {
        _users = [[NSUserDefaults standardUserDefaults] arrayForKey:USERS];
        if (!_users)
        {
            if (self.testValue) {
                _users = [self usersFromJsonFile];
            } else {
                _users = [[NSArray alloc] init];
            }
        }
    }
    return _users;
}

-(void) setUsers:(NSArray *)users {
    _users = users;
    [[NSUserDefaults standardUserDefaults] setObject:_users forKey:USERS];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(NSArray *) tests {
    if (!_tests) {
        _tests = [[NSUserDefaults standardUserDefaults] arrayForKey:TESTS];
        if (!_users)
        {
            if (self.testValue) {
                
                NSMutableArray *mArray = [[NSMutableArray alloc] initWithCapacity:10];
                for (int i =1; i<11; i++) {
                    [mArray addObject:[[MTTest alloc] initWithTableNumberEnum:i]];
                }
                
                
                
                _tests = [self usersFromJsonFile];
            } else {
                _tests = [[NSArray alloc] init];
            }
        }
    }
    return _tests;
}
-(NSDictionary *) userPlayHistoryDictionary {
    if (!_userPlayHistoryDictionary) {
        _userPlayHistoryDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:USER_PLAY_HISTORY];
        if (!_userPlayHistoryDictionary)
        {
            _userPlayHistoryDictionary = [[NSDictionary alloc] init];
        }
    }
    return _userPlayHistoryDictionary;
}

-(void) setUserPlayHistoryDictionary:(NSDictionary *)userPlayHistoryDictionary {
    _userPlayHistoryDictionary = userPlayHistoryDictionary;
    [[NSUserDefaults standardUserDefaults] setObject:_userPlayHistoryDictionary forKey:USER_PLAY_HISTORY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
-(NSDictionary *) testPlayHistoryDictionary {
    if (!_testPlayHistoryDictionary) {
        _testPlayHistoryDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:TEST_PLAY_HISTORY];
        if (!_testPlayHistoryDictionary)
        {
            _testPlayHistoryDictionary = [[NSDictionary alloc] init];
        }
    }
    return _testPlayHistoryDictionary;
}

-(void) setTestPlayHistoryDictionary:(NSDictionary *)testPlayHistoryDictionary {
    _testPlayHistoryDictionary = testPlayHistoryDictionary;
    [[NSUserDefaults standardUserDefaults] setObject:_testPlayHistoryDictionary forKey:TEST_PLAY_HISTORY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
#pragma mark - Utilities

-(NSArray *) usersFromJsonFile {
        //Content extraction
        NSError *error;
        NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"users" ofType:@"json"];
        NSString *jsonString = [[NSString alloc] initWithContentsOfFile:jsonPath encoding:NSUTF8StringEncoding error:NULL];
        //NSLog(@"jsonString:%@",jsonString);
        
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
        if (error) {
            NSLog(@"JSON Serialization Error %@", [error description]);
        }
        
        NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:10];
        for (NSDictionary *dic in jsonArray) {
            MTUser *user = [[MTUser alloc] init];
            user.name = [dic valueForKey:@"name"];
            user.picture = UIImageJPEGRepresentation([UIImage imageNamed:[dic valueForKey:@"picture"]],0.5);
            [items addObject:user];
        }
    return items;
}


@end
