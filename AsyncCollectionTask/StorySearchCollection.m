//
//  storysearchCollection.m
//  AsyncCollectionTask
//
//  Created by Roposo on 3/27/17.
//  Copyright © 2017 Roposo. All rights reserved.
//

#import "StorySearchCollection.h"
#import "StoryCollectionCell.h"
#import "DataProvider.h"

static const CGFloat kCellSpacing = 3;
static const CGFloat kLeftOuterPadding = 3;
static const CGFloat kLeftInnerPadding = 3;
//static const CGFloat kTopPadding = 3;

@interface StorySearchCollection() <ASCollectionDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSArray *imageCollectionArray;
@property (assign) NSInteger itemsInRow;
@property (assign) NSInteger itemsInCol;
@property (nonatomic, strong) ASCollectionNode *collectionNode;
@property (nonatomic, strong, nonnull) ASTextNode *title;
@property (nonatomic, strong, nonnull) ASTextNode *noOfPosts;
@property (nonatomic, strong, nonnull) ASTextNode *arrowText;
@property (nonatomic) CGSize cellSize;
@property (nonatomic, strong) ASDisplayNode *backNode;
@property (nonatomic, assign) CGFloat collectionNodeWidth;
@property (nonatomic, assign) CGFloat collectionNodeHeight;
@property (nonatomic) DataProvider *dataProvider;
//@property (nonatomic) UICollectionViewFlowLayout *flowLayout;
@end

@implementation StorySearchCollection


- (instancetype)initWithData:(NSArray *)imageArray title:(NSString *)title noOfPosts:(NSString *)noOfPosts rowItemCount:(NSInteger)rowItemCount colItemCount:(NSInteger)colItemCount {
    self = [super init];
    if (self) {
        _itemsInRow = rowItemCount;
        _itemsInCol = colItemCount;
        _imageCollectionArray = imageArray;
        _backNode = [[ASDisplayNode alloc] init];
        [self addSubnode:_backNode];
        [self calculateCollectionCellSize];
        _dataProvider = [[DataProvider alloc] init];
        [self p_initializationPart:imageArray title:title noOfPosts:noOfPosts rowItemCount:rowItemCount colItemCount:colItemCount];
    }
    return self;
}


- (void)p_initializationPart:(NSArray *)imageArray title:(NSString *)title noOfPosts:(NSString *)noOfPosts rowItemCount:(NSInteger)rowItemCount colItemCount:(NSInteger)colItemCount {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = _cellSize;
    flowLayout.minimumInteritemSpacing = 2.0;
    flowLayout.minimumLineSpacing = 2.0;
    _collectionNode = [[ASCollectionNode alloc] initWithCollectionViewLayout:flowLayout];
    _collectionNode.style.preferredSize = CGSizeMake(_collectionNodeWidth, _collectionNodeHeight);
    _collectionNode.dataSource = self;
    [self addSubnode:_collectionNode];
    
    BOOL textExists = false;
    if (title.length > 0) {
        textExists = true;
        [self p_setTitle:title];
        [self addSubnode:_title];
    }
    if (noOfPosts.length > 0) {
        textExists = true;
        [ self p_setNoOfPosts:noOfPosts];
        [self addSubnode:_noOfPosts];
    }
    
    if (textExists) {
        NSDictionary *attrs = @{ NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:18.0f], NSForegroundColorAttributeName:[_dataProvider colorFromRed:147 green:126 blue:130 andAlpha:.81]};
        _arrowText = [[ASTextNode alloc]init];
        _arrowText.attributedText = [[NSAttributedString alloc] initWithString:@">" attributes:attrs];
        [self addSubnode:_arrowText];
    }
}

- (void)p_setTitle:(NSString *)title {
    NSDictionary *attrs = @{ NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Medium" size:18.0f], NSForegroundColorAttributeName:[_dataProvider colorFromRed:77 green:23 blue:32 andAlpha:1]};
    _title = [[ASTextNode alloc] init];
    _title.attributedText = [[NSAttributedString alloc] initWithString:title attributes:attrs];
}

- (void)p_setNoOfPosts:(NSString *)noOfPosts {
    NSDictionary *attrs = @{ NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:12.0f], NSForegroundColorAttributeName:[_dataProvider colorFromRed:153 green:107 blue:115 andAlpha:1]};
    _noOfPosts = [[ASTextNode alloc] init];
    _noOfPosts.attributedText = [[NSAttributedString alloc] initWithString:noOfPosts attributes:attrs];
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    ASStackLayoutSpec *leftTextSpec = [ASStackLayoutSpec verticalStackLayoutSpec];
    ASStackLayoutSpec *fullTextSpec = [ASStackLayoutSpec horizontalStackLayoutSpec];
    ASStackLayoutSpec *withcollectionLayoutSpec = [ASStackLayoutSpec verticalStackLayoutSpec];
    
    NSMutableArray *leftTextArray = [[NSMutableArray alloc] init];
    NSMutableArray *finalArray = [[NSMutableArray alloc] init];
    if(_title) {
        [leftTextArray addObject:_title];
    }
    if(_noOfPosts) {
        [leftTextArray addObject:_noOfPosts];
    }
    
    if ([_imageCollectionArray count] > 0) {
        ASInsetLayoutSpec *collectionInsetSpec = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(kLeftInnerPadding, kLeftInnerPadding, kLeftInnerPadding, kLeftInnerPadding) child:_collectionNode];
        [finalArray addObject:collectionInsetSpec];
    }
    
    if ([leftTextArray count] > 0) {
        leftTextSpec.children = leftTextArray;
        leftTextSpec.style.flexGrow = 1;
        
        fullTextSpec.children = @[leftTextSpec, _arrowText];
        fullTextSpec.justifyContent = ASStackLayoutJustifyContentSpaceBetween;
        fullTextSpec.alignItems = ASStackLayoutAlignItemsCenter;
        fullTextSpec.style.alignSelf = ASStackLayoutAlignSelfStretch;
        ASInsetLayoutSpec *textInsetSpec = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(kLeftInnerPadding, 5*kLeftInnerPadding, kLeftInnerPadding, 5*kLeftInnerPadding) child:fullTextSpec];
        [finalArray addObject:textInsetSpec];
    }
    
    if ([finalArray count] > 0) {
        withcollectionLayoutSpec.children = finalArray;
        withcollectionLayoutSpec.style.alignSelf = ASStackLayoutJustifyContentSpaceAround;
        ASBackgroundLayoutSpec *afterBackLayout = [ASBackgroundLayoutSpec backgroundLayoutSpecWithChild:withcollectionLayoutSpec background:_backNode];
        ASInsetLayoutSpec *finalLayoutSpec = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(kLeftInnerPadding, kLeftInnerPadding, kLeftInnerPadding, kLeftInnerPadding) child:afterBackLayout];
        return finalLayoutSpec;
    }
    
    return nil;
}


- (void)calculateCollectionCellSize {
    _collectionNodeWidth = [[UIScreen mainScreen] bounds].size.width -2*kLeftOuterPadding - 2*kLeftInnerPadding;
    CGFloat cellWidth = (_collectionNodeWidth - (7*kCellSpacing))/8;
    _collectionNodeHeight = (cellWidth*3) + 2*kCellSpacing;
    
    cellWidth = (_collectionNodeWidth - (_itemsInRow - 1)*kCellSpacing)/_itemsInRow;
    cellWidth = cellWidth - .2;
    CGFloat cellHeight = (_collectionNodeHeight - (_itemsInCol - 1)*kCellSpacing)/_itemsInCol;
     _cellSize = CGSizeMake(cellWidth, cellHeight);
    NSLog(@"screen CollectionCellSize %f  %f", [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    NSLog(@"calculate CollectionCellSize %f  %f", _collectionNodeWidth, _collectionNodeHeight);
    NSLog(@"inside calculateCollectionCellSize %f %f %ld %ld", _cellSize.width, _cellSize.height, (long)_itemsInCol, (long)_itemsInRow);
}


- (ASCellNodeBlock)collectionNode:(ASCollectionNode *)collectionNode nodeBlockForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *url = [_imageCollectionArray objectAtIndex:indexPath.row];
    
    ASCellNode *(^cellNodeBlock)() = ^ASCellNode *() {
        StoryCollectionCell *cellNode = [[StoryCollectionCell alloc] initWithUrl:url size:_cellSize];
        return cellNode;
    };
    return cellNodeBlock;
}

- (NSInteger)collectionNode:(ASCollectionNode *)collectionNode numberOfItemsInSection:(NSInteger)section {
    return [_imageCollectionArray count];
}


@end
