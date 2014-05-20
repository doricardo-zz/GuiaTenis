//
//  AboutViewController.m
//  RecipeApp
//
//  Created by Simon on 24/12/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "AboutViewController.h"
#import "RecipeTableViewController.h"
#import "RecipeTableCell.h"
#import "RecipeDetailViewController.h"
#import "Tenis.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithCoder:(NSCoder *)aCoder
{
    self = [super initWithCoder:aCoder];
    if (self) {
        // The className to query on
        self.parseClassName = @"Tenis";
        // The key of the PFObject to display in the label of the default cell style
        self.textKey = @"name";
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
        // Whether the built-in pagination is enabled
        self.paginationEnabled = NO;
        
    }
    return self;
}

- (PFQuery *)queryForTable
{
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    [query whereKey:@"pisada" containsString:@"Neutro"];
    [query orderByDescending:@"ano"];
    
    return query;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath
                                                                               *)indexPath object:(PFObject *)object
{
    static NSString *CellIdentifier = @"CustomTableCell";
    RecipeTableCell *cell = (RecipeTableCell *)[self.tableView
                                                dequeueReusableCellWithIdentifier:CellIdentifier];
    // Configure the cell
    PFFile *thumbnail = [object objectForKey:@"imagem"];
    PFImageView *thumbnailImageView = (PFImageView*)cell.thumbnailImageView;
    thumbnailImageView.image = [UIImage imageNamed:@"placeholder.jpg"];
    thumbnailImageView.file = thumbnail;
    [thumbnailImageView loadInBackground];
    cell.nameLabel.text = [object objectForKey:@"name"];
    cell.prepTimeLabel.text = [object objectForKey:@"ano"];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showRecipeDetail"]) {
        //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        //RecipeDetailViewController *destViewController = segue.destinationViewController;
        
        //Recipe *recipe = [recipes objectAtIndex:indexPath.row];
        //destViewController.recipe = recipe;
    }
}


@end
