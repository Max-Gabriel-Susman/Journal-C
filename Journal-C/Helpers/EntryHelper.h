//
//  EntryHelper.h
//  Journal-C
//
//  Created by Moses on 5/4/20.
//  Copyright © 2020 Max Susman. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EntryHelper : NSObject

+ (NSArray *)entries;
+ (NSArray *)timestamps;
+ (NSArray *)bodyTexts;

@end

NS_ASSUME_NONNULL_END
