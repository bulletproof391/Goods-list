//
//  ProgrammingBook.m
//  Goods list
//
//  Created by Дмитрий Вашлаев on 13.01.18.
//  Copyright © 2018 Дмитрий Вашлаев. All rights reserved.
//

#import "ProgrammingBook.h"

@implementation ProgrammingBook

- (NSString *)getAdditionalInfo {
    return [NSString stringWithFormat:@"Pages %li\nProgramming language %@", self.pagesCount, self.programmingLanguage];
}

- (NSString *)goodsCategory {
    return @"Programming";
}
@end
