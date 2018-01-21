//
//  CellViewModel.m
//  Goods list
//
//  Created by Дмитрий Вашлаев on 14.01.18.
//  Copyright © 2018 Дмитрий Вашлаев. All rights reserved.
//

#import "CellViewModel.h"

@interface CellViewModel ()
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *category;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSURL *imageURL;
@end

@implementation CellViewModel

- (instancetype)initWithGoods:(Goods *)goods {
    self = [super init];
    
    if (self) {
        self.name = goods.name;
        self.category = [goods goodsCategory];
        self.imageURL = goods.imageURL;
    }
    
    return self;
}

#pragma mark - Networking
- (RACSignal *)signalForLoadingImage {
    RACScheduler *scheduler = [RACScheduler schedulerWithPriority:RACSchedulerPriorityBackground];

    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        if (!self.image) {
            NSData *data = [NSData dataWithContentsOfURL:self.imageURL];
            UIImage *image = [UIImage imageWithData:data];
            self.image = image;
        }
        
        [subscriber sendNext:self.image];
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
