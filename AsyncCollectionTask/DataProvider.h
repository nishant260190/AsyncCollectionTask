//
//  dataProvider.h
//  AsyncCollectionTask
//
//  Created by Roposo on 3/28/17.
//  Copyright © 2017 Roposo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataProvider : NSObject
- (NSArray *) getDataArray;
- (UIColor *)colorFromRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue andAlpha:(CGFloat)alpha;
@end
