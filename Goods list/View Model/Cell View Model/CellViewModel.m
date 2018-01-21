//
//  CellViewModel.m
//  Goods list
//
//  Created by Дмитрий Вашлаев on 14.01.18.
//  Copyright © 2018 Дмитрий Вашлаев. All rights reserved.
//

#import "CellViewModel.h"

@interface CellViewModel ()
//@property (weak, nonatomic) NSString *name;
//@property (weak, nonatomic) NSString *category;
//@property (weak, nonatomic) UIImage *image;
//@property (weak, nonatomic) NSURL *imageURL;
@end

@implementation CellViewModel

- (instancetype)initWithGoods:(Goods *)goods {
    self = [super init];
    
    if (self) {
        self.name = goods.name;
        self.category = [self goodsCategory:goods];
        self.imageURL = goods.imageURL;
    }
    
    return self;
}

- (NSString *)goodsCategory:(Goods *)goods {
    if ([goods isMemberOfClass:[ProgrammingBook class]])
        return GoodsCategoryProgrammingBook;
    
    if ([goods isMemberOfClass:[CookeryBook class]])
        return GoodsCategoryCookeryBook;
    
    if ([goods isMemberOfClass:[EsotericBook class]])
        return GoodsCategoryEsotericBook;
    
    if ([goods isKindOfClass:[Disk class]]) {
        switch (((Disk *)goods).contentType) {
            case DiskContentTypeMusic:
            return GoodsCategoryMusicDisk;
            
            case DiskContentTypeVideo:
            return GoodsCategoryVideoDisk;
            
            case DiskContentTypeSoftware:
            return GoodsCategorySoftwareDisk;
        }
    }
    
    return nil;
}

#pragma mark - Networking
- (RACSignal *)signalForLoadingImage {
    RACScheduler *scheduler = [RACScheduler schedulerWithPriority:RACSchedulerPriorityBackground];

    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSData *data = [NSData dataWithContentsOfURL:self.imageURL];
        UIImage *image = [UIImage imageWithData:data];
        self.image = image;
        [subscriber sendNext:image];
        [subscriber sendCompleted];
        return nil;
    }] subscribeOn:scheduler];
}


#pragma mark - Methods for View
- (UIImage *)getImage {
    return self.image;
}

- (NSString *)getName {
    return self.name;
}

- (NSString *)getCategory {
    return self.category;
}
@end
