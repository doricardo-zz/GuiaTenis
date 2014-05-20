//
//  CustomTableViewController.m
//  CustomTable
//
//  Created by Simon on 7/12/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "RecipeTableViewController.h"
#import "RecipeTableCell.h"
#import "RecipeDetailViewController.h"
#import "Tenis.h"
#import "SWRevealViewController.h"
#import "HelpViewController.h"

@interface RecipeTableViewController ()

@end

@implementation RecipeTableViewController
{
    NSString *format;

}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    _sidebarButton.tintColor = [UIColor colorWithWhite:0.96f alpha:1.0f];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
   
    _helpbarButton.tintColor = [UIColor colorWithWhite:0.96f alpha:1.0f];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    //_helpbarButton.target = self.helpViewController;
    //_helpbarButton.action = @selector(revealToggle:);
    
    
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
    
    if ([self.title  isEqual: @"Supinador"])
        [query whereKey:@"pisada" containsString:self.title];
    else if ([self.title  isEqual: @"Neutro"])
        [query whereKey:@"pisada" containsString:self.title];
    else if ([self.title  isEqual: @"Pronador"])
        [query whereKey:@"pisada" containsString:self.title];
    else if ([self.title  isEqual: @"Amortecimento"])
        [query whereKey:@"categoria" containsString:self.title];
    else if ([self.title  isEqual: @"Competição"])
        [query whereKey:@"categoria" containsString:self.title];
    else if ([self.title  isEqual: @"Estabilidade"])
        [query whereKey:@"categoria" containsString:self.title];
    else if ([self.title  isEqual: @"Leveza"])
        [query whereKey:@"categoria" containsString:self.title];
    else if ([self.title  isEqual: @"Levíssimo"])
        [query whereKey:@"categoria" containsString:self.title];
    else if ([self.title  isEqual: @"Minimalista"])
        [query whereKey:@"categoria" containsString:self.title];
    else if ([self.title  isEqual: @"Multipisada"])
        [query whereKey:@"categoria" containsString:self.title];
    else if ([self.title  isEqual: @"Trilha"])
        [query whereKey:@"categoria" containsString:self.title];
    else
        Nil;

    if ([self.title  isEqual: @"Amortecimento"])
        self.navigationItem.rightBarButtonItem = NO;
    else if ([self.title  isEqual: @"Competicao"])
        self.navigationItem.rightBarButtonItem = NO;
    else if ([self.title  isEqual: @"Estabilidade"])
        self.navigationItem.rightBarButtonItem = NO;
    else if ([self.title  isEqual: @"Leveza"])
        self.navigationItem.rightBarButtonItem = NO;
    else if ([self.title  isEqual: @"Levissimo"])
        self.navigationItem.rightBarButtonItem = NO;
    else if ([self.title  isEqual: @"Minimalista"])
        self.navigationItem.rightBarButtonItem = NO;
    else if ([self.title  isEqual: @"Multipisada"])
        self.navigationItem.rightBarButtonItem = NO;
    else if ([self.title  isEqual: @"Trilha"])
        self.navigationItem.rightBarButtonItem = NO;
    else
        nil;
   
    
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
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showRecipeDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        RecipeDetailViewController *destViewController = segue.destinationViewController;
        
        PFObject *recipePFObject = [self objectAtIndexPath:indexPath];
        destViewController.tenis = recipePFObject;
    }
    if ([segue.identifier isEqualToString:@"showHelp"]) {
        HelpViewController *helpViewController = segue.destinationViewController;
        helpViewController.title = self.title;
        
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

- (IBAction)HelpButton:(id)sender {
    
    
}
@end
