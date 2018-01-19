//
//  GoodsTableViewCell.h
//  Goods list
//
//  Created by Дмитрий Вашлаев on 14.01.18.
//  Copyright © 2018 Дмитрий Вашлаев. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellViewModel.h"

@interface GoodsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *coverImage;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *category;

@property (strong, nonatomic) CellViewModel *viewModel;
@end
