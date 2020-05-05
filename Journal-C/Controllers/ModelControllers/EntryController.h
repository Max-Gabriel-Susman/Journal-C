//
//  EntryController.h
//  Journal-C
//
//  Created by Moses on 5/4/20.
//  Copyright © 2020 Max Susman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntryController : NSObject

// MARK: - Shared Instance
+ (EntryController *)sharedController;//shared instance

// MARK: - Source of Truth
@property (nonatomic, strong) NSArray *entries;
// MARK: - Methods
- (void)addEntriesObject:(Entry *)entry;
- (void)removeEntriesObject:(Entry *)entry;
- (void)saveToPersistentStorage;

@end

NS_ASSUME_NONNULL_END
