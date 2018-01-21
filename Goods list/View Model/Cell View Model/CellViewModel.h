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

static NSString *GoodsCategoryProgrammingBook = @"Программирование";
static NSString *GoodsCategoryCookeryBook = @"Кулинария";
static NSString *GoodsCategoryEsotericBook = @"Эзотерика";
static NSString *GoodsCategoryMusicDisk = @"Музыка";
static NSString *GoodsCategoryVideoDisk = @"Видео";
static NSString *GoodsCategorySoftwareDisk = @"ПО";

@interface CellViewModel : NSObject
@property (weak, nonatomic) NSString *name;
@property (weak, nonatomic) NSString *category;
@property (weak, nonatomic) UIImage *image;
@property (weak, nonatomic) NSURL *imageURL;

- (RACSignal *)signalForLoadingImage;
- (instancetype)initWithGoods:(Goods *)goods;
- (UIImage *)getImage;
- (NSString *)getName;
- (NSString *)getCategory;
@end
