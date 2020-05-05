//
//  EntryController.m
//  Journal-C
//
//  Created by Moses on 5/4/20.
//  Copyright © 2020 Max Susman. All rights reserved.
//

#import "EntryController.h"
//#import "EntryHelper.h"
//#import "Entry.h"

static NSString * const EntriesKey = @"entries";

@interface EntryController ()

@property (nonatomic, strong) NSMutableArray *internalEntries;

@end

@implementation EntryController

+ (EntryController *)sharedController
{
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[EntryController alloc] init];
        [sharedInstance loadFromPersistentStorage];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalEntries = [NSMutableArray array];
    }
    return self;
}

- (void)saveToPersistentStorage
{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (Entry *entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryRepresentation];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:EntriesKey];
}

- (void)loadFromPersistentStorage
{
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:EntriesKey];
    for (NSDictionary *dictionary in entryDictionaries) {
        Entry *entry = [[Entry alloc] initWithDictionary:dictionary];
        [self addEntriesObject:entry];
    }
}

#pragma mark - Properties

- (NSArray *)entries { return self.internalEntries; }

- (void)addEntriesObject:(Entry *)entry
{
    [self.internalEntries addObject:entry];
}

- (void)removeEntriesObject:(Entry *)entry
{
    [self.internalEntries removeObject:entry];
}

@end
