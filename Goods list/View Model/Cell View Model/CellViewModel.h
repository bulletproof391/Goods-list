//
//  CellViewModel.h
//  Goods list
//
//  Created by Дмитрий Вашлаев on 14.01.18.
//  Copyright © 2018 Дмитрий Вашлаев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa.h>
#import "Goods.h"

@interface CellViewModel : NSObject

- (instancetype)initWithGoods:(Goods *)goods;
- (RACSignal *)signalForLoadingImage;
- (NSString *)getName;
- (NSString *)getCategory;

@end
