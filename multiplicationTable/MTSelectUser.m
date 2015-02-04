//
//  selectUser.m
//  multiplicationTable
//
//  Created by Olivier Delecueillerie on 23/12/2014.
//  Copyright (c) 2014 lagspoon. All rights reserved.
//

#import "MTSelectUser.h"
#import <circleCollectionControlLib/circleCollectionItemModel.h>
#import "MTStorageEngine.h"
#import "MTUser.h"
#import "MTGameSelectionButton.h"




#import "MTSelectTableVC.h"

//#import "MTGame.h"


@interface MTSelectUser ()
@property (weak, nonatomic) IBOutlet UIView *userCollectionViewContainer;
@property (weak, nonatomic) IBOutlet UIView *buttonContainerView;

@property (strong, nonatomic) circleCollectionView *userCollectionView;


@property (weak, nonatomic) IBOutlet MTGameSelectionButton *button00;
@property (weak, nonatomic) IBOutlet MTGameSelectionButton *button01;
@property (weak, nonatomic) IBOutlet MTGameSelectionButton *button10;
@property (weak, nonatomic) IBOutlet MTGameSelectionButton *button11;


@property (weak, nonatomic) IBOutlet UIImageView *IV;



@property (strong, nonatomic) NSArray *games;
@end

@implementation MTSelectUser



#pragma mark - Accessors



#pragma mark - VC Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Harry Metic";
    self.buttonContainerView.hidden = YES;
    
    //instantiate user collection
    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:10];
    for (MTUser *user in [[MTStorageEngine sharedInstance] users]) {
        [items addObject:[circleCollectionItemModel newWithName:user.name
                                                        picture:[UIImage imageWithData:user.picture]
                                                          color:nil]];
    }
    self.userCollectionView = [circleCollectionView newCircleCollectionViewEmbeddedIn:self.userCollectionViewContainer
                                                                      includeData:items
                                                               withAddButtonImage:[UIImage imageNamed:@"Add"]
                                                                      delegatedBy:self];

    
    
}


-(void) viewWillAppear:(BOOL)animated {
    self.button00.titleText = @"Table\nmultiplication";
    self.button01.titleText = @"Line1\nLine2";
    self.button10.titleText = @"Line1\nLine2";
    self.button11.titleText = @"Line1\nLine2";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - circleCollectionView Delegate
-(void) collectionView:(circleCollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.buttonContainerView.hidden = NO;
}
-(void) collectionView:(circleCollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.buttonContainerView.hidden = YES;
}


#pragma mark - trigerred actions

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[MTSelectTableVC class]]) {
        
        
        //instantiate backButtonItem
        
        
        
        UIImage *backButtonBackgroundImage = [self.userCollectionView selectedUserIcon];
        // The background should be pinned to the left and not stretch.
        backButtonBackgroundImage = [backButtonBackgroundImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, backButtonBackgroundImage.size.width, 0, backButtonBackgroundImage.size.width)];
        /*
         id appearance = [UIBarButtonItem appearanceWhenContainedIn:[CustomBackButtonNavController class], nil];
         [appearance setBackButtonBackgroundImage:backButtonBackgroundImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
         */
        // Provide an empty backBarButton to hide the 'Back' text present by
        // default in the back button.
        //
        // NOTE: You do not need to provide a target or action.  These are set
        //       by the navigation bar.
        // NOTE: Setting the title of this bar button item to ' ' (space) works
        //       around a bug in iOS 7.0.x where the background image would be
        //       horizontally compressed if the back button title is empty.
        UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStylePlain target:nil action:NULL];
        [backBarButton setBackButtonBackgroundImage:backButtonBackgroundImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        self.navigationItem.backBarButtonItem = backBarButton;
        
        
        MTSelectTableVC *destinationVC = (MTSelectTableVC *)segue.destinationViewController;
    }
    
    
}





@end
