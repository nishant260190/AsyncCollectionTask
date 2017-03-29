//
//  StoryCollectionCell.m
//  AsyncCollectionTask
//
//  Created by Roposo on 3/27/17.
//  Copyright © 2017 Roposo. All rights reserved.
//

#import "StoryCollectionCell.h"

//static CGFloat kInsets = 15.0;

@interface StoryCollectionCell ()
@property (nonatomic, strong) ASNetworkImageNode *imageNode;
@property CGSize cellSize;
@end

@implementation StoryCollectionCell

- (instancetype)initWithUrl:(NSString *)url size:(CGSize) cellSize {
    if (self = [super init]) {
        _imageNode = [[ASNetworkImageNode alloc] init];
        
        _cellSize = cellSize;
        _imageNode.URL = [NSURL URLWithString:url];
        [self addSubnode:_imageNode];
    }
    
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
//    CGFloat ratio = constrainedSize.min.height/constrainedSize.min.width;
    ASRatioLayoutSpec *ratioImageLayout = [ASRatioLayoutSpec ratioLayoutSpecWithRatio:1.0 child:self.imageNode];
    ratioImageLayout.style.flexGrow = 1.0;
    return ratioImageLayout;
}

@end
