//
//  ListTVCViewModel.h
//  Goods list
//
//  Created by Дмитрий Вашлаев on 13.01.18.
//  Copyright © 2018 Дмитрий Вашлаев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa.h>
#import "GoodsModel.h"
#import "CellViewModel.h"

@interface ListTVCViewModel : NSObject

@property (nonatomic, strong) RACSignal *hasUpdated;

- (instancetype)initWithModel:(GoodsModel *)model;
- (NSInteger)numberOfSections;
- (NSString *)titleForHeaderInSection:(NSInteger)section;
- (NSInteger)numberOfRowsInSection:(NSInteger)section;
- (CellViewModel *)getCellViewModelAtIndexPath:(NSIndexPath *)indexPath;
@end
