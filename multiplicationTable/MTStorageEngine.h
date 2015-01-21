//
//  storageEngine.h
//  multiplicationTable
//
//  Created by Olivier Delecueillerie on 23/12/2014.
//  Copyright (c) 2014 lagspoon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTStorageEngine : NSObject


+ (MTStorageEngine *)sharedInstance;

-(NSArray *) users;
-(NSArray *) tests;
@end
