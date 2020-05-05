//
//  EntryViewController.h
//  Journal-C
//
//  Created by Moses on 5/4/20.
//  Copyright © 2020 Max Susman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EntryController.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntryViewController : UIViewController

@property (nonatomic, strong) Entry *entry;

@end

NS_ASSUME_NONNULL_END
