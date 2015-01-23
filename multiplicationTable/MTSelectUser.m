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



@interface MTSelectUser ()
@property (weak, nonatomic) IBOutlet UIView *collectionViewContainer;


@property (strong, nonatomic) circleCollectionView *collectionView;
@end

@implementation MTSelectUser

-(void) collectionView:(circleCollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Mental calculation";
    
    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:10];
    for (MTUser *user in [[MTStorageEngine sharedInstance] users]) {
        [items addObject:[circleCollectionItemModel newWithName:user.name
                                                        picture:[UIImage imageWithData:user.picture]
                                                          color:nil]];
    }
    
    self.collectionView = [circleCollectionView newCircleCollectionViewEmbeddedIn:self.collectionViewContainer
                                                                      includeData:items
                                                               withAddButtonImage:[UIImage imageNamed:@"Add"]
                                                                      delegatedBy:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - circleCollectionView Delegate





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
