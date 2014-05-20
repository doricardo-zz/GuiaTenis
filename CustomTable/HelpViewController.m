//
//  HelpViewController.m
//  GuiaTenis
//
//  Created by Ricardo Andrade on 18/05/2014.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "HelpViewController.h"

@interface HelpViewController ()

@end

@implementation HelpViewController

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
    // Do any additional setup after loading the view.
    
    if ([self.title  isEqual: @"Supinador"])
       self.pisadaImageViewContainer.image = [UIImage imageNamed:@"PisadaSupinada.png"];
    else if ([self.title  isEqual: @"Neutro"])
       self.pisadaImageViewContainer.image = [UIImage imageNamed:@"PisadaNeutra.png"];
    else if ([self.title  isEqual: @"Pronador"])
       self.pisadaImageViewContainer.image = [UIImage imageNamed:@"PisadaPronada.png"];
    else
        Nil;
    
    
    if ([self.title  isEqual: @"Supinador"])
        self.textPisadaLabel.text = @"Ao tocar o chão o pé apoia-se no seu lado mais interno e se contorciona para dentro, usando o dedão para ganha impulso";
    else if ([self.title  isEqual: @"Neutro"])
        self.textPisadaLabel.text = @"O pé toca o chão apoiando o lado externo do calcanhar e se move levemente para dentro, seguindo em linha reta";
    else if ([self.title  isEqual: @"Pronador"])
        self.textPisadaLabel.text = @"O pé toca o chão no lado externo do calcanhar e continua o movimento usando o seu lado mais externo, pegando impulso no dedinho";
    else
        Nil;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)backButton:(id)sender {
        [self.navigationController popViewControllerAnimated:YES];
}
@end
