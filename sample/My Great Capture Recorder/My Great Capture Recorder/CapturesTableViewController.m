//
//  CapturesTableViewController.m
//  My Great Capture Recorder
//
//  Created by Thomas N Beatty on 7/23/12.
//  Copyright (c) 2012 Strabo, LLC. All rights reserved.
//

#import "CapturesTableViewController.h"

@interface CapturesTableViewController (InternalMethods)
// Reloads the capture array from the file system
// Should be called if there are any changes to the list of
// captures (like additions or deletions).
-(void)refreshCaptureArray;
@end

@implementation CapturesTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom Initialization
    }
    return self;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self refreshCaptureArray];
    [self.tableView reloadData];
}

-(void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // There is only one section in this table view
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    // This is the number of captures in the array.
    return [captureArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    // Set the title
    cell.textLabel.text = [(STRCapture *)[captureArray objectAtIndex:[indexPath indexAtPosition:1]] title];
    cell.detailTextLabel.text = @"Detail";
    
    return cell;
}

// Support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the capture associated with the row
        STRCapture * captureToDelete = [captureArray objectAtIndex:[indexPath indexAtPosition:1]];
        if ([[STRCaptureFileManager defaultManager] deleteCaptureWithToken:captureToDelete.token]) {
            [self refreshCaptureArray];
            // Delete the row from the data source
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Load a new detail view controller
    CaptureDetailViewController * detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"captureDetailViewController"];
    detailViewController.localCapture = [captureArray objectAtIndex:[indexPath indexAtPosition:1]];
    
    // Present the view controller
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end

@implementation CapturesTableViewController (InternalMethods)

-(void)refreshCaptureArray {
    // Load the contents of the list
    STRCaptureFileManager * captureFileManager = [STRCaptureFileManager defaultManager];
    captureArray = [captureFileManager allCapturesSorted:YES];
}

@end
