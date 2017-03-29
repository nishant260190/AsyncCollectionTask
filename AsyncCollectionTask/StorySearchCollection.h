//
//  storysearchCollection.h
//  AsyncCollectionTask
//
//  Created by Roposo on 3/27/17.
//  Copyright © 2017 Roposo. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@protocol StorySearchCollection <NSObject>
@end

@interface StorySearchCollection : ASCellNode
@property (weak) id <StorySearchCollection> delegate;


- (instancetype)initWithData:(NSArray *)imageArray title:(NSString *)title noOfPosts:(NSString *)noOfPosts rowItemCount:(NSInteger)rowItemCount colItemCount:(NSInteger)colItemCount;
@end
