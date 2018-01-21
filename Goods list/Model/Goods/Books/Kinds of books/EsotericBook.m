//
//  EsoterikBook.m
//  Goods list
//
//  Created by Дмитрий Вашлаев on 13.01.18.
//  Copyright © 2018 Дмитрий Вашлаев. All rights reserved.
//

#import "EsotericBook.h"

@implementation EsotericBook

- (NSString *)getAdditionalInfo {
    return [NSString stringWithFormat:@"Pages %li\nMinimum reader age %li", self.pagesCount, self.minReaderAge];
}

- (NSString *)goodsCategory {
    return @"Esoteric";
}

@end
