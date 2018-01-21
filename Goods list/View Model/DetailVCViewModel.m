//
//  DetailVCViewModel.m
//  Goods list
//
//  Created by Дмитрий Вашлаев on 21.01.18.
//  Copyright © 2018 Дмитрий Вашлаев. All rights reserved.
//

#import "DetailVCViewModel.h"

@interface DetailVCViewModel ()
@property (nonatomic, strong) Goods *goods;
@end

@implementation DetailVCViewModel

- (instancetype)initWithGoods:(Goods *)goods {
    self = [super init];
    
    if (self) {
        self.goods = goods;
    }
    
    return  self;
}

- (RACSignal *)getImage {
    return RACObserve(self, goods.image);
}

- (NSString *)getPrice {
    return [NSString stringWithFormat:@"%li", self.goods.price];
}

- (NSString *)getName {
    return self.goods.name;
}

- (NSString *)getBarcode {
    return self.goods.barCode;
}

- (NSString *)getAdditionalInfo {
   return [self.goods getAdditionalInfo];
}

@end
