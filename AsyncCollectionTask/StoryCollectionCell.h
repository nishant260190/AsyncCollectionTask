//
//  StoryCollectionCell.h
//  AsyncCollectionTask
//
//  Created by Roposo on 3/27/17.
//  Copyright © 2017 Roposo. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface StoryCollectionCell : ASCellNode
- (instancetype)initWithUrl:(NSString *)url size:(CGSize) cellSize;
@end
