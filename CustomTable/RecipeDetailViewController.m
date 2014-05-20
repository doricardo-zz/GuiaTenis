//
//  RecipeDetailViewController.m
//  RecipeApp
//
//  Created by Simon on 23/12/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "RecipeDetailViewController.h"
#import <Social/Social.h>

@interface RecipeDetailViewController ()

@end

@implementation RecipeDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
      return YES;
}

- (void)viewDidLoad
{

    [super viewDidLoad];
    
    PFFile *thumbnail = [self.tenis objectForKey:@"imagem"];
    self.recipeImageView.image = [UIImage imageNamed:@"noimage.png"];
    self.recipeImageView.file = thumbnail;
    [self.recipeImageView loadInBackground];
    
    self.title = [self.tenis objectForKey:@"name"];
    self.fabricante.text = [self.tenis objectForKey:@"fabricante"];
    self.anoLabel.text = [self.tenis objectForKey:@"ano"];
    self.precoLabel.text = [self.tenis objectForKey:@"preco"];
    self.numeracaoLabel.text = [self.tenis objectForKey:@"numeracao"];
    self.pesoLabel.text = [self.tenis objectForKey:@"peso"];
    self.categoriaLabel.text = [self.tenis objectForKey:@"categoria"];
    self.sexoLabel.text = [self.tenis objectForKey:@"sexo"];
    self.pisadaLabel.text = [self.tenis objectForKey:@"pisada"];
    self.arcoLabel.text = [self.tenis objectForKey:@"farco"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (IBAction)postToFacebook:(id)sender {
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
     
        [controller setInitialText:[NSString stringWithFormat:@"%@ %@ %@ ",@"Tênis",self.fabricante.text,self.title] ];
        [controller addImage:self.recipeImageView.image];
        [controller addURL:[NSURL URLWithString:@"http://itunes.apple.com"]];

        [self presentViewController:controller animated:YES completion:Nil];
    }
}



- (IBAction)backButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
