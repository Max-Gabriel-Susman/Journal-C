//
//  Entry.m
//  Journal-C
//
//  Created by Moses on 5/4/20.
//  Copyright © 2020 Max Susman. All rights reserved.
//

#import "Entry.h"

static NSString *const TitleKey = @"title";
static NSString *const TextKey = @"text";
static NSString *const TimeStampKey = @"timestamp";

@implementation Entry

- (instancetype)initWithTitle:(NSString *)title text:(NSString *)text timeStamp:(NSDate *)timestamp
{
    self = [super init];
    if (self) {
        _title = title;
        _text = text;
        _timestamp = timestamp;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[TitleKey];
    NSString *text = dictionary[TextKey];
    NSDate *timestamp = dictionary[TimeStampKey];
    return [self initWithTitle:title text:text timeStamp:timestamp];
}

- (NSDictionary *)dictionaryRepresentation
{
    return @{TitleKey: self.title,
             TextKey: self.text,
             TimeStampKey: self.timestamp};
}

- (BOOL)isEqual:(id)object
{
    if (![object isKindOfClass:[Entry class]]) { return NO; }
    return [[self dictionaryRepresentation] isEqualToDictionary:[(Entry *)object dictionaryRepresentation]];
}

@end
