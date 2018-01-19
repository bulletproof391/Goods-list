//
//  GoodsTableViewCell.m
//  Goods list
//
//  Created by Дмитрий Вашлаев on 14.01.18.
//  Copyright © 2018 Дмитрий Вашлаев. All rights reserved.
//

#import "GoodsTableViewCell.h"

@implementation GoodsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)initializeCell {
    self.coverImage.image = [self.viewModel getImage];
    self.name.text = [self.viewModel getName];
    self.category.text = [self.viewModel getCategory];
}
@end
