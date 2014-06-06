//
//  SidebarViewController.m
//  SidebarDemo
//
//  Created by Simon on 29/6/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "SidebarViewController.h"
#import "SWRevealViewController.h"
#import "AboutViewController.h"
#import "AppsfireSDK.h"

//#import "PhotoViewController.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface SidebarViewController ()

@end

@implementation SidebarViewController {
    NSArray *menuItems;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    
    if (self) {
        // Custom initialization
    }
    return self;
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    menuItems = @[@"sugestoes",@"novidades", @"pisada", @"supinador", @"neutro", @"pronador", @"categoria", @"amortecimento", @"competicao", @"estabilidade", @"leveza", @"levissimo", @"minimalista", @"multipisada", @"trilha"];

    //self.view.backgroundColor = UIColorFromRGB(0xFF6D44);
    //self.view.backgroundColor = [UIColor lightGrayColor];
    //self.tableView.backgroundColor = [UIColor lightGrayColor];`
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [self.tableView deselectRowAtIndexPath:indexPath animated:YES];

    if (indexPath.row == 0) {
        //[AppsfireSDK setBackgroundColor:UIColorFromRGB(0xFF6D44) textColor:[UIColor whiteColor]];
        [AppsfireSDK presentPanelForContent:AFSDKPanelContentFeedbackOnly withStyle:AFSDKPanelStyleFullscreen];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [menuItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [menuItems objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    //cell.backgroundColor = [UIColor lightGrayColor];
    //cell.textLabel.tintColor = [UIColor whiteColor];
    //cell.textLabel.font = [UIFont systemFontOfSize:17.0];
    return cell;
}

- (void) prepareForSegue: (UIStoryboardSegue *) segue sender: (id) sender
{
    // Set the title of navigation bar by using the menu items
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    UINavigationController *destViewController = (UINavigationController*)segue.destinationViewController;
    destViewController.title = [[menuItems objectAtIndex:indexPath.row] capitalizedString];
    
    if ( [segue isKindOfClass: [SWRevealViewControllerSegue class]] ) {
        SWRevealViewControllerSegue *swSegue = (SWRevealViewControllerSegue*) segue;
        
        swSegue.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc) {
            
            UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
            [navController setViewControllers: @[dvc] animated: NO ];
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
        };
        
    }
    
    if ([segue.identifier isEqualToString:@"showAbout"]) {
        AboutViewController *aboutViewController = segue.destinationViewController;
        aboutViewController.title = self.title;
    }
    
}

@end
