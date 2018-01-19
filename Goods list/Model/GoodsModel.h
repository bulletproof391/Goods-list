//
//  GoodsModel.h
//  Goods list
//
//  Created by Дмитрий Вашлаев on 13.01.18.
//  Copyright © 2018 Дмитрий Вашлаев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa.h>

@interface GoodsModel : NSObject

@property (nonatomic, strong) RACSignal *hasUpdated;
- (instancetype)init;
- (NSMutableArray *)fetchData;
@end
