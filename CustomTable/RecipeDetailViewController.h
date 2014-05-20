//
//  RecipeDetailViewController.h
//  RecipeApp
//
//  Created by Simon on 23/12/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "Tenis.h"

@interface RecipeDetailViewController : UIViewController

- (IBAction)postToFacebook:(id)sender;


@property (weak, nonatomic) IBOutlet PFImageView *recipeImageView;
@property (weak, nonatomic) IBOutlet UILabel *prepTimeLabel;
@property (weak, nonatomic) IBOutlet UITextView *ingredientsTextView;

@property (weak, nonatomic) IBOutlet UILabel *anoLabel;
@property (weak, nonatomic) IBOutlet UILabel *fabricante;
@property (weak, nonatomic) IBOutlet UILabel *precoLabel;

@property (weak, nonatomic) IBOutlet UILabel *numeracaoLabel;
@property (weak, nonatomic) IBOutlet UILabel *pesoLabel;
@property (weak, nonatomic) IBOutlet UILabel *sexoLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoriaLabel;
@property (weak, nonatomic) IBOutlet UILabel *arcoLabel;
@property (weak, nonatomic) IBOutlet UILabel *pisadaLabel;
@property (weak, nonatomic) IBOutlet UILabel *descricaoLabel;


@property (nonatomic, strong) PFObject *tenis;

- (IBAction)backButton:(id)sender;


@end
