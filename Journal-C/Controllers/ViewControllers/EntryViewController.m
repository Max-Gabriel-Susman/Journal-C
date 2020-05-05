//
//  EntryViewController.m
//  Journal-C
//
//  Created by Moses on 5/4/20.
//  Copyright © 2020 Max Susman. All rights reserved.
//

#import "EntryViewController.h"
#import "EntryController.h"

@interface EntryViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *textTextView;


@end

@implementation EntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    [self updateViews];
}

- (void)updateViews
{
    if (!self.entry) return;
    
    self.titleTextField.text = self.entry.title;
    self.textTextView.text = self.entry.text;
}

#pragma mark - Actions

- (IBAction)saveButtonTapped:(id)sender
{
    if (self.entry) {

        self.entry.title = self.titleTextField.text;
        self.entry.text = self.textTextView.text;
        self.entry.timestamp = [NSDate date];

    } else {

        Entry *entry = [[Entry alloc] initWithTitle:self.titleTextField.text text:self.textTextView.text timeStamp:[NSDate date]];

        [[EntryController sharedController] addEntriesObject:entry];

        self.entry = entry;
    }

    [self.navigationController popViewControllerAnimated:true];
}
- (IBAction)clearButtonTapped:(id)sender
{
    self.titleTextField.text = @"";
    self.textTextView.text = @"";
}

#pragma mark - UITextFieldDelegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Properties

- (void)setEntry:(Entry *)entry
{
    if (entry != _entry) {
        _entry = entry;
        [self updateViews];
    }
}

@end

