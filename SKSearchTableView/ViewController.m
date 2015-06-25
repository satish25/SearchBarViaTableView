//
//  ViewController.m
//  SKSearchTableView
//
//  Created by satheesh on 6/22/15.
//  Copyright (c) 2015 Satish. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray * dataArray;
    NSArray * searchDataArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    dataArray=[[NSMutableArray alloc]initWithObjects:
               @"Wake up at 6 am",
               @"Work out for 30 min",
               @"Eat healthy breakfast",
               @"dress up for office",
               @"Login to your system",
               @"Check email",
               @"Start working on project",
               @"Take a tea break",
               @"Have lunch with friends",
               @"Submit work to manager",
               @"Leave office for the day",
               nil];
    
    searchDataArray=dataArray;
}

#pragma mark TableMethods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [searchDataArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"cellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [searchDataArray objectAtIndex:indexPath.row];

    
    return cell;
    

}

#pragma mark Search Methods

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [self.mSearchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [self.mSearchBar setShowsCancelButton:NO animated:YES];
    searchBar.text=@"";
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText.length>0) {
        searchText = [searchText stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSLog(@"its pincode");
        NSPredicate *predicate =
        [NSPredicate predicateWithFormat: @"SELF CONTAINS[cd] %@", searchText];
        searchDataArray= [dataArray filteredArrayUsingPredicate:predicate];
        [_mTableView reloadData];
    }
    else
    {
        searchDataArray=dataArray;
        [_mTableView reloadData];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.mSearchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.mSearchBar resignFirstResponder];
    searchDataArray=dataArray;
    
    [self.mTableView reloadData];
}

#pragma mark Memory Methods
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
