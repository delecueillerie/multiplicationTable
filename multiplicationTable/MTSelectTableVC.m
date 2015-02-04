//
//  MTSelectTableVC.m
//  multiplicationTable
//
//  Created by Olivier Delecueillerie on 03/02/2015.
//  Copyright (c) 2015 lagspoon. All rights reserved.
//

#import "MTSelectTableVC.h"
#import <circleCollectionControlLib/circleCollectionItemModel.h>
#import "MTTable.h"
#import "MTStorageEngine.h"

@interface MTSelectTableVC ()


@property (strong, nonatomic) circleCollectionView *tableCollectionView;


@property (weak, nonatomic) IBOutlet UIView *collectionViewContainer;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MTSelectTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.title = @"Multiplication table";
    //instantiate user collection
    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:10];
    for (MTTable *table in [[MTStorageEngine sharedInstance] multiplicationTables]) {
        [items addObject:[circleCollectionItemModel newWithName:table.name
                                                        picture:[UIImage imageWithData:table.picture]
                                                          color:[UIColor blueColor]]];
    }
    self.tableCollectionView = [circleCollectionView newCircleCollectionViewEmbeddedIn:self.collectionViewContainer
                                                                          includeData:items
                                                                   withAddButtonImage:nil
                                                                          delegatedBy:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - circleCollectionView Delegate
-(void) collectionView:(circleCollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}
-(void) collectionView:(circleCollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {

}


@end
