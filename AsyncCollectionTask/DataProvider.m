//
//  dataProvider.m
//  AsyncCollectionTask
//
//  Created by Roposo on 3/28/17.
//  Copyright © 2017 Roposo. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "DataProvider.h"

@implementation DataProvider

- (instancetype) init {
    self = [super init];
    return self;
}

- (NSArray *) getDataArray {
    
    return [NSArray arrayWithObjects:[[NSDictionary alloc] initWithObjectsAndKeys:@3,@"imgX",
                               
                               @1,@"imgY",
                                      
                               @[@"https://img0.ropose.com/story/6281489648242347866943_A0FDD9AEimg_i102.jpeg",
                                 
                                 @"https://img0.ropose.com/story/PHpr_1489466861500_81478693_a270.jpeg",
                                 
                                 @"https://img0.ropose.com/story/1751489391503837373047_68EAD608img_i102.jpeg"],@"images", nil],
            [[NSDictionary alloc] initWithObjectsAndKeys:
             
             @"43 Products",@"noOfProducts",
             
             @"Bridal Collections",@"title", nil],
            
            [[NSDictionary alloc] initWithObjectsAndKeys:@3,@"imgX",
             
             @1,@"imgY",
             
             @"Black Dress",@"title",
             
             @[@"https://img0.ropose.com/story/6281489648242347866943_A0FDD9AEimg_i102.jpeg",
               
               @"https://img0.ropose.com/story/PHpr_1489466861500_81478693_a270.jpeg",
               
               @"https://img0.ropose.com/story/1751489391503837373047_68EAD608img_i102.jpeg"],@"images", nil],
     
     [[NSDictionary alloc] initWithObjectsAndKeys:@8,@"imgX",
      
      @3,@"imgY",
      
      @"43 Products",@"noOfProducts",
      
      @[@"https://img0.ropose.com/story/6281489648242347866943_A0FDD9AEimg_i102.jpeg",
        
        @"https://img0.ropose.com/story/9221489067853971167969_73DBCAC6img_i102.jpeg",
        
        @"https://img0.ropose.com/story/7031488895103081083984_A1FFA74Dimg_i102.jpeg",
        
        @"https://img0.ropose.com/story/4801489142091811942139_311C31E5img_i102.jpeg",
        
        @"https://img0.ropose.com/story/6071489023755025708008_80D91485img_i102.jpeg",
        
        @"https://img0.ropose.com/story/1489164953744617920_34D31259801.jpeg",
        
        @"https://img0.ropose.com/story/6991488955679489690186_74841A5Fimg_i102.jpeg",
        
        @"https://img0.ropose.com/story/7741489290854332050049_A61D1B42img_i102.jpeg",
        
        @"https://img0.ropose.com/story/PHpr_1489466861500_81478693_a270.jpeg",
        
        @"https://img0.ropose.com/story/1nZn_1489045097983_8f2afc72_a179.jpeg",
        
        @"https://img0.ropose.com/story/1751489391503837373047_68EAD608img_i102.jpeg",
        
        @"https://img0.ropose.com/story/6071489023755025708008_80D91485img_i102.jpeg",
        
        @"https://img0.ropose.com/story/1489164953744617920_34D31259801.jpeg",
        
        @"https://img0.ropose.com/story/6991488955679489690186_74841A5Fimg_i102.jpeg",
        
        @"https://img0.ropose.com/story/7741489290854332050049_A61D1B42img_i102.jpeg",
        
        @"https://img0.ropose.com/story/PHpr_1489466861500_81478693_a270.jpeg",
        
        @"https://img0.ropose.com/story/1nZn_1489045097983_8f2afc72_a179.jpeg",
        
        @"https://img0.ropose.com/story/1751489391503837373047_68EAD608img_i102.jpeg",
        
        @"https://img0.ropose.com/story/6071489023755025708008_80D91485img_i102.jpeg",
        
        @"https://img0.ropose.com/story/1489164953744617920_34D31259801.jpeg",
        
        @"https://img0.ropose.com/story/6991488955679489690186_74841A5Fimg_i102.jpeg",
        
        @"https://img0.ropose.com/story/7741489290854332050049_A61D1B42img_i102.jpeg",
        
        @"https://img0.ropose.com/story/PHpr_1489466861500_81478693_a270.jpeg",
        
        @"https://img0.ropose.com/story/1751489391503837373047_68EAD608img_i102.jpeg"],@"images", nil],
     
     [[NSDictionary alloc] initWithObjectsAndKeys:@3,@"imgX",
      
      @8,@"imgY",
      
      @"Vacation Outfits",@"title",
      
      @"143 Products",@"noOfProducts",
      
      @[@"https://img0.ropose.com/story/6281489648242347866943_A0FDD9AEimg_i102.jpeg",
        
        @"https://img0.ropose.com/story/9221489067853971167969_73DBCAC6img_i102.jpeg",
        
        @"https://img0.ropose.com/story/7031488895103081083984_A1FFA74Dimg_i102.jpeg",
        
        @"https://img0.ropose.com/story/4801489142091811942139_311C31E5img_i102.jpeg",
        
        @"https://img0.ropose.com/story/6071489023755025708008_80D91485img_i102.jpeg",
        
        @"https://img0.ropose.com/story/1489164953744617920_34D31259801.jpeg",
        
        @"https://img0.ropose.com/story/6991488955679489690186_74841A5Fimg_i102.jpeg",
        
        @"https://img0.ropose.com/story/7741489290854332050049_A61D1B42img_i102.jpeg",
        
        @"https://img0.ropose.com/story/PHpr_1489466861500_81478693_a270.jpeg",
        
        @"https://img0.ropose.com/story/1nZn_1489045097983_8f2afc72_a179.jpeg",
        
        @"https://img0.ropose.com/story/1751489391503837373047_68EAD608img_i102.jpeg",
        
        @"https://img0.ropose.com/story/6071489023755025708008_80D91485img_i102.jpeg",
        
        @"https://img0.ropose.com/story/1489164953744617920_34D31259801.jpeg",
        
        @"https://img0.ropose.com/story/6991488955679489690186_74841A5Fimg_i102.jpeg",
        
        @"https://img0.ropose.com/story/7741489290854332050049_A61D1B42img_i102.jpeg",
        
        @"https://img0.ropose.com/story/PHpr_1489466861500_81478693_a270.jpeg",
        
        @"https://img0.ropose.com/story/1nZn_1489045097983_8f2afc72_a179.jpeg",
        
        @"https://img0.ropose.com/story/1751489391503837373047_68EAD608img_i102.jpeg",
        
        @"https://img0.ropose.com/story/6071489023755025708008_80D91485img_i102.jpeg",
        
        @"https://img0.ropose.com/story/1489164953744617920_34D31259801.jpeg",
        
        @"https://img0.ropose.com/story/6991488955679489690186_74841A5Fimg_i102.jpeg",
        
        @"https://img0.ropose.com/story/7741489290854332050049_A61D1B42img_i102.jpeg",
        
        @"https://img0.ropose.com/story/PHpr_1489466861500_81478693_a270.jpeg",
        
        @"https://img0.ropose.com/story/1751489391503837373047_68EAD608img_i102.jpeg"],@"images", nil], nil];
}


- (UIColor *)colorFromRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue andAlpha:(CGFloat)alpha {
    return [UIColor colorWithRed:red/255 green:green/255 blue:blue/255 alpha:alpha];
}
@end
