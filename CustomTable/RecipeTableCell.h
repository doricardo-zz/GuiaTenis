//
//  RecipeTableCell.h
//  RecipeApp
//
//  Created by Simon on 11/12/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeTableCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *prepTimeLabel;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;
@property (nonatomic, weak) IBOutlet UILabel *fabricanteLabel;
@property (nonatomic, weak) IBOutlet UILabel *precoLabel;
@property (nonatomic, weak) IBOutlet UILabel *pisadaLabel;
@property (nonatomic, weak) IBOutlet UILabel *categoriaLabel;

@end
