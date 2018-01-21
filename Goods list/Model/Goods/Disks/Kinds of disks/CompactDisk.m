//
//  CompactDisk.m
//  Goods list
//
//  Created by Дмитрий Вашлаев on 13.01.18.
//  Copyright © 2018 Дмитрий Вашлаев. All rights reserved.
//

#import "CompactDisk.h"

@implementation CompactDisk

- (NSString *)getAdditionalInfo {
    NSString *info;
    switch (self.contentType) {
        case DiskContentTypeMusic:
        info = [NSString stringWithFormat:@"Music CD"];
        break;
        
        case DiskContentTypeVideo:
        info = [NSString stringWithFormat:@"Video CD"];
        break;
        
        case DiskContentTypeSoftware:
        info = [NSString stringWithFormat:@"Software CD"];
        break;
    }
    
    return info;
}

@end
