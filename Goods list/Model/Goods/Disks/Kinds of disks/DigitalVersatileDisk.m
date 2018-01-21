//
//  DigitalVersatileDisk.m
//  Goods list
//
//  Created by Дмитрий Вашлаев on 13.01.18.
//  Copyright © 2018 Дмитрий Вашлаев. All rights reserved.
//

#import "DigitalVersatileDisk.h"

@implementation DigitalVersatileDisk

- (NSString *)getAdditionalInfo {
    NSString *info;
    switch (self.contentType) {
        case DiskContentTypeMusic:
        info = [NSString stringWithFormat:@"Music DVD"];
        break;
        
        case DiskContentTypeVideo:
        info = [NSString stringWithFormat:@"Video DVD"];
        break;
        
        case DiskContentTypeSoftware:
        info = [NSString stringWithFormat:@"Software DVD"];
        break;
    }
    
    return info;
}

@end
