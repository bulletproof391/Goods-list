//
//  ListTVCViewModel.m
//  Goods list
//
//  Created by Дмитрий Вашлаев on 13.01.18.
//  Copyright © 2018 Дмитрий Вашлаев. All rights reserved.
//

#import "ListTVCViewModel.h"
#import "Goods.h"

@interface ListTVCViewModel ()
@property (nonatomic, strong) GoodsModel *model;
@property (nonatomic, strong) NSMutableArray <Goods *> *goodsList;
@end

@implementation ListTVCViewModel

- (instancetype)initWithModel:(GoodsModel *)model {
    self = [super init];
    if (self) {
        _model = model;
    }
    return self;
}

@end
