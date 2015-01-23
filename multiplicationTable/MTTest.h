//
//  test.h
//  multiplicationTable
//
//  Created by Olivier Delecueillerie on 19/12/2014.
//  Copyright (c) 2014 lagspoon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTTest : NSObject

typedef NS_ENUM(NSInteger, tableNumberEnum) {
    table1 = 1,
    table2 = 2,
    table3 = 3,
    table4 = 4,
    table5 = 5,
    table6 = 6,
    table7 = 7,
    table8 = 8,
    table9 = 9,
    table10=10,
};




-(instancetype) initWithTableNumberEnum:(tableNumberEnum)tableNumber;

@end




