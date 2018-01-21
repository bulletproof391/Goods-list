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
#import "ProgrammingBook.h"
#import "CookeryBook.h"
#import "EsotericBook.h"
#import "CompactDisk.h"
#import "DigitalVersatileDisk.h"

@interface CellViewModel : NSObject

- (instancetype)initWithGoods:(Goods *)goods;
- (RACSignal *)signalForLoadingImage;
- (NSString *)getName;
- (NSString *)getCategory;

@end
