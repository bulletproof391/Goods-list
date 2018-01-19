//
//  CellViewModel.h
//  Goods list
//
//  Created by Дмитрий Вашлаев on 14.01.18.
//  Copyright © 2018 Дмитрий Вашлаев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Goods.h"
#import "ProgrammingBook.h"
#import "CookeryBook.h"
#import "EsotericBook.h"
#import "CompactDisk.h"
#import "DigitalVersatileDisk.h"

static NSString *GoodsCategoryProgrammingBook = @"Программирование";
static NSString *GoodsCategoryCookeryBook = @"Кулинария";
static NSString *GoodsCategoryEsotericBook = @"Эзотерика";
static NSString *GoodsCategoryMusicDisk = @"Музыка";
static NSString *GoodsCategoryVideoDisk = @"Видео";
static NSString *GoodsCategorySoftwareDisk = @"ПО";

@interface CellViewModel : NSObject
- (instancetype)initWithGoods:(Goods *)goods;
- (UIImage *)getImage;
- (NSString *)getName;
- (NSString *)getCategory;
@end
