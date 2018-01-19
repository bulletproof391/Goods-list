//
//  ListTVCViewModel.m
//  Goods list
//
//  Created by Дмитрий Вашлаев on 13.01.18.
//  Copyright © 2018 Дмитрий Вашлаев. All rights reserved.
//

#import "ListTVCViewModel.h"
#import "Goods.h"

static NSString *SectionHeaderBook = @"Книги";
static NSString *SectionHeaderDisks = @"Диски";

typedef NS_ENUM(NSInteger, SectionIndex) {
    SectionIndexBooks,
    SectionIndexDisks
};

@interface ListTVCViewModel ()
@property (nonatomic, strong) GoodsModel *model;
@property (nonatomic, strong) NSArray *goodsList;
@property (nonatomic, strong) NSArray *cellViewModelsList;
@end

@implementation ListTVCViewModel

- (instancetype)initWithModel:(GoodsModel *)model {
    self = [super init];
    if (self) {
        _model = model;
        [RACObserve(self.model, hasUpdated) subscribeNext:^(id x) {
            self.goodsList = [self.model fetchData];
            self.cellViewModelsList = [self initializeCellViewModelsList];
            self.hasUpdated = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                return nil;
            }];
            NSLog(@"data updated");
        }];
    }
    return self;
}

- (NSArray *)initializeCellViewModelsList {
    NSMutableArray *viewModelsList = [[NSMutableArray alloc] init];
    
    for (NSArray *section in self.goodsList) {
        NSMutableArray<CellViewModel *> *sectionViewModels = [[NSMutableArray alloc] init];
        
        for (Goods *item in section) {
            CellViewModel *cellViewModel = [[CellViewModel alloc] initWithGoods:item];
            [sectionViewModels addObject:cellViewModel];
        }
        
        [viewModelsList addObject:sectionViewModels];
    }
    
    return viewModelsList;
}

- (NSInteger)numberOfSections {
    return self.goodsList.count;
}

- (NSString *)titleForHeaderInSection:(NSInteger)section {
    NSString *title;
    
    switch (section) {
        case SectionIndexBooks:
        title = SectionHeaderBook;
        break;
        
        case SectionIndexDisks:
        title = SectionHeaderDisks;
        break;
    }
    return title;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return ((NSArray *)self.goodsList[section]).count;
}

- (CellViewModel *)getCellViewModelAtIndexPath:(NSIndexPath *)indexPath {
    return [((NSArray *)self.cellViewModelsList[indexPath.section]) objectAtIndex:indexPath.row];
}

@end
