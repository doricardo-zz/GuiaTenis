//
//  NovidadesTableViewController.m
//  GuiaTenis
//
//  Created by Ricardo Andrade on 14/05/2014.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "NovidadesTableViewController.h"
#import "RecipeTableCell.h"
#import "RecipeDetailViewController.h"
#import "Tenis.h"
#import "SWRevealViewController.h"

@interface NovidadesTableViewController ()

@end

@implementation NovidadesTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _sidebarButton.tintColor = [UIColor colorWithWhite:0.96f alpha:1.0f];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];

    
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
        self.paginationEnabled = YES;
        self.objectsPerPage = 7;
        
    }
    return self;
}


- (PFQuery *)queryForTable
{
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];

    [query whereKey:@"status" containsString:@"Novo"];
    
    [query orderByDescending:@"ano"];
    
    query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    
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
    thumbnailImageView.image = [UIImage imageNamed:@"iTunesArtwork.png"];
    thumbnailImageView.file = thumbnail;
    [thumbnailImageView loadInBackground];
    
    cell.nameLabel.text = [object objectForKey:@"name"];
    cell.precoLabel.text = [object objectForKey:@"preco"];
    cell.fabricanteLabel.text = [object objectForKey:@"fabricante"];
    cell.categoriaLabel.text = [object objectForKey:@"categoria"];
    cell.pisadaLabel.text = [object objectForKey:@"pisada"];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showRecipeDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        RecipeDetailViewController *destViewController = segue.destinationViewController;
        
        PFObject *recipePFObject = [self objectAtIndexPath:indexPath];
        destViewController.tenis = recipePFObject;
    }
}

- (void)refreshTable:(NSNotification *) notification
{
    // Reload the recipes
    [self loadObjects];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove the row from data model
    PFObject *object = [self.objects objectAtIndex:indexPath.row];
    [object deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        [self refreshTable:nil];
    }];
}

@end