//
//  Disk.h
//  Goods list
//
//  Created by Дмитрий Вашлаев on 13.01.18.
//  Copyright © 2018 Дмитрий Вашлаев. All rights reserved.
//

#import "Goods.h"

typedef NS_ENUM(NSInteger, DiskContentType) {
    DiskContentTypeMusic,
    DiskContentTypeVideo,
    DiskContentTypeSoftware,
};

@interface Disk : Goods
@property (readonly) DiskContentType contentType;
@end
