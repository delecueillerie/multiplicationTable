//
//  MTTable.m
//  multiplicationTable
//
//  Created by Olivier Delecueillerie on 03/02/2015.
//  Copyright (c) 2015 lagspoon. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "MTTable.h"

@implementation MTTable


-(UIImage *)imageFromText:(NSString *)text
{
    // set the font type and size
    UIFont *font = [UIFont systemFontOfSize:20.0];
    NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObjectsAndKeys: font, NSFontAttributeName, [NSNumber numberWithFloat:1.0], NSBaselineOffsetAttributeName, nil];
    CGSize size  = [text sizeWithAttributes:attrsDictionary];
    
    UIGraphicsBeginImageContextWithOptions(size,NO,0.0);
    
    // optional: add a shadow, to avoid clipping the shadow you should make the context size bigger
    //
    // CGContextRef ctx = UIGraphicsGetCurrentContext();
    // CGContextSetShadowWithColor(ctx, CGSizeMake(1.0, 1.0), 5.0, [[UIColor grayColor] CGColor]);
    
    // draw in context, you can use also drawInRect:withFont:
    

    [text drawAtPoint:CGPointMake(0.0f, 0.0f) withAttributes:attrsDictionary];
    // transfer image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
