//
//  MTGameSelectionButton.m
//  multiplicationTable
//
//  Created by Olivier Delecueillerie on 03/02/2015.
//  Copyright (c) 2015 lagspoon. All rights reserved.
//

#import "MTGameSelectionButton.h"

@implementation MTGameSelectionButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void) setTitleText:(NSString *)titleText {
    _titleText = titleText;
    
    [self setTitle: self.titleText forState: UIControlStateNormal];
}


-(id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        self.layer.cornerRadius = 10.0f;
        self.clipsToBounds = YES;
        
        
        self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;


        //self.backgroundColor =
        
        
    }
    
    return self;
}

@end
