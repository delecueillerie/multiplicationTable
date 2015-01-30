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
#import "MTGame.h"

#import "MTGameCVCell.h"


@interface MTSelectUser ()
@property (weak, nonatomic) IBOutlet UIView *userCollectionViewContainer;

@property (strong, nonatomic) circleCollectionView *userCollectionView;

@property (strong, nonatomic) NSArray *games;
@end

@implementation MTSelectUser



#pragma mark - Accessors

-(NSArray *) games {
    if (!_games) {
        _games = [[MTStorageEngine sharedInstance] games];
    }
    return _games;
}





- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Harry Metic";
    
    
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
    //instantiate game collection
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - circleCollectionView Delegate
-(void) collectionView:(circleCollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - collectionView DataSource
-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSLog(@"cout %li",[self.games count]);
    return [self.games count];
}


-(MTGameCVCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MTGameCVCell *cell;
    
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    MTGame *game = [self.games objectAtIndex:indexPath.item];
    
    cell.name.text = game.name;
    cell.picture.image = [UIImage imageWithData:game.picture];

    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
