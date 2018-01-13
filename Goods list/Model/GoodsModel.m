//
//  GoodsModel.m
//  Goods list
//
//  Created by Дмитрий Вашлаев on 13.01.18.
//  Copyright © 2018 Дмитрий Вашлаев. All rights reserved.
//

#import "GoodsModel.h"
#import "Goods.h"

@interface GoodsModel ()
@property (strong, nonatomic) NSMutableArray<Goods *> *goodsList;
@end

@implementation GoodsModel

- (instancetype)init {
    self = [super init];
    if (self) {
        [GoodsModel readDataFromFile:^(RACSignal *signal) {
            self.hasUpdated = signal;
            self.goodsList = [signal valueForKey:@"value"];
        }];
    }
    
    return self;
}


+ (void)readDataFromFile:(void (^)(RACSignal *))completion {
    NSMutableArray <Goods *> *goodsList = [[NSMutableArray alloc] init];
    
    NSError *error;
    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"goods" ofType:@"json"];
    NSData *dataFile = [NSData dataWithContentsOfFile:fileName options:NSDataReadingMappedAlways error:&error];
    NSDictionary *goodsDictionary = [NSJSONSerialization JSONObjectWithData:dataFile
                                                                    options:NSJSONReadingMutableContainers
                                                                      error:&error];
    
    if (error) {
        NSLog(@"%@", [error description]);
        completion(nil);
        return;
    }
    
    completion([RACSignal return:goodsList]);
}
@end

