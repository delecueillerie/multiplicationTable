//
//  user.m
//  multiplicationTable
//
//  Created by Olivier Delecueillerie on 23/12/2014.
//  Copyright (c) 2014 lagspoon. All rights reserved.
//

#import "MTUser.h"

@implementation MTUser


-(NSDictionary *) userDictionary {
    NSDictionary *userDic = [NSDictionary dictionaryWithObjectsAndKeys:self.name, @"name", nil];
    return userDic;
}
@end
