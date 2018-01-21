//
//  Disk.m
//  Goods list
//
//  Created by Дмитрий Вашлаев on 13.01.18.
//  Copyright © 2018 Дмитрий Вашлаев. All rights reserved.
//

#import "Disk.h"

@implementation Disk

- (NSString *)goodsCategory {
    NSString *category;
    
    switch (self.contentType) {
        case DiskContentTypeSoftware:
        category = @"Software";
        break;
        
        case DiskContentTypeVideo:
        category = @"Video";
        break;
        
        case DiskContentTypeMusic:
        category = @"Music";
        break;
    }
    
    return category;
}

@end
