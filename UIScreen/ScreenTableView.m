//
//  ScreenTableView.m
//  UIScreen
//
//  Created by KSHRD on 7/3/16.
//  Copyright © 2016 Teckchun. All rights reserved.
//

#import "ScreenTableView.h"
#import "CustomCell.h"
#import "ScreenTableViewControllerDetail.h"

@implementation ScreenTableView{
    NSArray * nameList;
}
@synthesize searchController;
@synthesize displayedItems;
@synthesize filteredItems;

-(void)viewDidLoad{
    nameList = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut",@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut",@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut",@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", nil];
    _tvController.delegate=self;
    _tvController.dataSource=self;
    // Create a list to hold search results (filtered list)
    self.filteredItems = [[NSMutableArray alloc] init];
    // Initially display the full list.  This variable will toggle between the full and the filtered lists.
    self.displayedItems = nameList;
    [self prepareSearchController];
    //[self prepareForSegue:@"showTableViewDetail" sender:nameList];
    NSLog(@"abbb");
    
}

-(void)prepareSearchController{
    // Here's where we create our UISearchController
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.searchBar.delegate = self;
    [self.searchController.searchBar sizeToFit];
    // Add the UISearchBar to the top header of the table view
    self.tableView.tableHeaderView = self.searchController.searchBar;
    // Hides search bar initially.  When the user pulls down on the list, the search bar isrevealed.
    [self.tableView setContentOffset:CGPointMake(0, self.searchController.searchBar.frame.size.height)];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return nameList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // default cell
//    UITableViewCell * cell;
    
    CustomCell *customCell = [tableView dequeueReusableCellWithIdentifier: @"Cell"];
    
    // set value for cell's controls
    customCell.imgVPro.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld", (long)indexPath.row+1]];
  
    customCell.labeTitle.text = displayedItems[indexPath.row];
    
    customCell.txtvDetail.text = [NSString stringWithFormat:@"detail %ld", (long)indexPath.row];
    
    return customCell;
    
}

// When the user types in the search bar, this method gets called.
- (void)updateSearchResultsForSearchController:(UISearchController *)aSearchController {
    NSLog(@"updateSearchResultsForSearchController");
    NSString *searchString = aSearchController.searchBar.text;
    NSLog(@"searchString=%@", searchString);
    // Check if the user cancelled or deleted the search term so we can display the full listinstead.
    if (![searchString isEqualToString:@""]) {
        [self.filteredItems removeAllObjects];
        for (NSString *str in nameList) {
            if ([searchString isEqualToString:@""] || [str                                             localizedCaseInsensitiveContainsString:searchString] == YES) {
                NSLog(@"str=%@", str);
                [self.filteredItems addObject:str];
            }
        }
        self.displayedItems = self.filteredItems;
    }
    else {
        self.displayedItems = nameList;
    }
    [self.tableView reloadData];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
//    [self performSegueWithIdentifier:@"showTableViewDetail" sender:[nameList objectAtIndex:indexPath.row]];
   
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showTableViewDetail"]) {
        NSIndexPath *indexPath = [self.tvController indexPathForSelectedRow];
        
//                Scr *destViewController = segue.destinationViewController;
//        
//                destViewController.recipeName = [recipes objectAtIndex:indexPath.row];
            }
}


@end
