//
//  DetailViewController.h
//  Goods list
//
//  Created by Дмитрий Вашлаев on 21.01.18.
//  Copyright © 2018 Дмитрий Вашлаев. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailVCViewModel.h"

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *coverImage;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *barcodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *additionalInfoLabel;

@property (strong, nonatomic) DetailVCViewModel *viewModel;

@end
