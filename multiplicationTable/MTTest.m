//
//  test.m
//  multiplicationTable
//
//  Created by Olivier Delecueillerie on 19/12/2014.
//  Copyright (c) 2014 lagspoon. All rights reserved.
//

#import "MTTest.h"

@interface MTTest ()

@property (strong, nonatomic) NSArray *multiplicationArray;
@end


@implementation MTTest


const int tableLimitInt = 10;

/*///////////////////////////////////////////////////////////////
 ACCESSORS 
 ///////////////////////////////////////////////////////////////*/
-(NSArray *) multiplicationArray {
    if (!_multiplicationArray) {
        NSMutableArray *mArray = [[NSMutableArray alloc] init];
        for (int i=0; i<=tableLimitInt; i++) {
            mArray[i]=[NSNumber numberWithInt:i*self.tableNumber];
        }
        _multiplicationArray = [NSArray arrayWithArray:mArray];
    }
    return _multiplicationArray;
}



/*///////////////////////////////////////////////////////////////
 INITIALIZER
///////////////////////////////////////////////////////////////*/


-(instancetype) initWithTableNumberEnum:(tableNumberEnum)tableNumber {
    
    self = [super init];
    if (self) {
        self.tableNumber = tableNumber;
    }
    return self;
}



@end
