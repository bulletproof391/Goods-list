//
//  DetailVCViewModel.h
//  Goods list
//
//  Created by Дмитрий Вашлаев on 21.01.18.
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

@interface DetailVCViewModel : NSObject

- (instancetype)initWithGoods:(Goods *)goods;
- (RACSignal *)getImage;
- (NSString *)getPrice;
- (NSString *)getName;
- (NSString *)getBarcode;
- (NSString *)getAdditionalInfo;
@end
