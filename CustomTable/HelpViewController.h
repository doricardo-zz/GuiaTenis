//
//  HelpViewController.h
//  GuiaTenis
//
//  Created by Ricardo Andrade on 18/05/2014.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelpViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *pisadaImageViewContainer;

@property (strong, nonatomic) IBOutlet UITextView *textPisadaLabel;

- (IBAction)backButton:(id)sender;


@end
