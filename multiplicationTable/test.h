//
//  test.h
//  multiplicationTable
//
//  Created by Olivier Delecueillerie on 19/12/2014.
//  Copyright (c) 2014 lagspoon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface test : NSObject

typedef NS_ENUM(NSInteger, tableNumberEnum) {
    table2,
    table3,
    table4,
    table5,
    table6,
    table7,
    table8,
    table9
};




@property (nonatomic) tableNumberEnum tableNumber;


@end




