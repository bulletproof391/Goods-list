//
//  CookeryBook.m
//  Goods list
//
//  Created by Дмитрий Вашлаев on 13.01.18.
//  Copyright © 2018 Дмитрий Вашлаев. All rights reserved.
//

#import "CookeryBook.h"

@implementation CookeryBook

- (NSString *)getAdditionalInfo {
    return [NSString stringWithFormat:@"Pages %li\nMain ingredient %@", self.pagesCount, self.mainIngredient];
}

- (NSString *)goodsCategory {
    return @"Cookery";
}

@end
