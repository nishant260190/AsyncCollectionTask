//
//  ViewController.m
//  AsyncCollectionTask
//
//  Created by Roposo on 3/27/17.
//  Copyright © 2017 Roposo. All rights reserved.
//

#import "ViewController.h"
#import "StorySearchCollection.h"
#import "DataProvider.h"

static NSString * const kTitle = @"Black dress";
static NSString * const kNoOfPost = @"40 posts";
static NSInteger const rowItemCount = 8;
static NSInteger const colItemCount = 3;

@interface ViewController () <ASTableDataSource, ASTableDelegate>
@property (nonatomic, strong) ASTableNode *tableNode;
@property (nonatomic, strong) NSArray *data;
@property (nonatomic) DataProvider *dataProvider;
@end

@implementation ViewController


- (instancetype)init {
    _tableNode = [[ASTableNode alloc] initWithStyle:UITableViewStylePlain];
    self = [super initWithNode:_tableNode];
    if (self) {
        _tableNode.dataSource = self;
        _tableNode.delegate = self;
        _dataProvider = [[DataProvider alloc] init];
        _data = [_dataProvider getDataArray];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _tableNode.view.allowsSelection = NO;
    _tableNode.view.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableNode.view.leadingScreensForBatching = 3.0;  // default is 2.0
    _tableNode.view.backgroundColor = [_dataProvider colorFromRed:248 green:245 blue:246 andAlpha:1];
    [self.view addSubnode:_tableNode];
}


- (NSInteger)numberOfSectionsInTableNode:(ASTableNode *)tableNode {
    return 1;
}

- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {

    return [_data count];
}


- (ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *cellData = [_data objectAtIndex:indexPath.row];
    
    ASCellNode *(^cellNodeBlock)() = ^ASCellNode *() {
//        StorySearchCollection *cellNode = [[StorySearchCollection alloc] initWithData:[self setOfImages] title:kTitle noOfPosts:kNoOfPost rowItemCount:(NSInteger)rowItemCount colItemCount:(NSInteger)colItemCount];
        StorySearchCollection *cellNode = [[StorySearchCollection alloc] initWithData:cellData[@"images"] title:cellData[@"title"] noOfPosts:cellData[@"noOfProducts"] rowItemCount:[cellData[@"imgX"] integerValue] colItemCount:[cellData[@"imgY"] integerValue]];
        cellNode.backgroundColor = [UIColor whiteColor];
        return (id)cellNode;
    };
    
    return cellNodeBlock;
}


- (NSArray *)setOfImages {
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 24; i++){
        [array addObject:@"https://www.starcelebritydresses.com/uploads/product/2016/4/lea-seydoux-bright-yellow-celebrity-prom-dress-bafta-awards-2015-thumb.jpg"];
    }
    return array;
}

@end
