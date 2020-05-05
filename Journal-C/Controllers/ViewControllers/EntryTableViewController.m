//
//  EntryTableViewController.m
//  Journal-C
//
//  Created by Moses on 5/4/20.
//  Copyright © 2020 Max Susman. All rights reserved.
//

#import "EntryTableViewController.h"
#import "EntryViewController.h"
#import "EntryController.h"

@interface EntryTableViewController ()

@end

@implementation EntryTableViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[EntryController sharedController] entries] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"showEntry" forIndexPath:indexPath];
    
    EntryController *entryController = [EntryController sharedController];
    Entry *entry = entryController.entries[indexPath.row];
    
    cell.textLabel.text = entry.title;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toViewEntry"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        Entry *entry = [EntryController sharedController].entries[indexPath.row];
        
        EntryViewController *detailViewController = segue.destinationViewController;
        detailViewController.entry = entry;
    }
}

@end
