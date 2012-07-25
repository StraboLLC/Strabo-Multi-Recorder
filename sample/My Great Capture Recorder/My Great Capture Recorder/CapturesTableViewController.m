//
//  CapturesTableViewController.m
//  My Great Capture Recorder
//
//  Created by Thomas N Beatty on 7/23/12.
//  Copyright (c) 2012 Strabo, LLC. All rights reserved.
//

#import "CapturesTableViewController.h"

@interface CapturesTableViewController ()

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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // Load the contents of the list
    STRCaptureFileManager * captureFileManager = [STRCaptureFileManager defaultManager];
    captureArray = [captureFileManager allCapturesSorted:YES];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    NSLog(@"Performing segue");
//    if ([segue.identifier isEqualToString:@"detailSegue"]) {
//        // Load the destination controller with the capture that was just selected from the table
//        CaptureDetailViewController * detailViewController = segue.destinationViewController;
//        NSLog(@"Loading capture info.");
//        [detailViewController loadInfoForCapture:selectedCapture];
//    }
//}

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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    // Set the title
    cell.textLabel.text = [(STRCapture *)[captureArray objectAtIndex:[indexPath indexAtPosition:1]] title];
    cell.detailTextLabel.text = @"Detail";
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

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
