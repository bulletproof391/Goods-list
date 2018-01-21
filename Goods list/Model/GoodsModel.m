//
//  GoodsModel.m
//  Goods list
//
//  Created by Дмитрий Вашлаев on 13.01.18.
//  Copyright © 2018 Дмитрий Вашлаев. All rights reserved.
//

#import "GoodsModel.h"
#import "ProgrammingBook.h"
#import "CookeryBook.h"
#import "EsotericBook.h"
#import "CompactDisk.h"
#import "DigitalVersatileDisk.h"

@interface GoodsModel ()
@property (strong, nonatomic) NSMutableArray *goodsList;
@end

@implementation GoodsModel

- (instancetype)init {
    self = [super init];
    if (self) {
        [self readDataFromFile:^(RACSignal *signal) {
            self.goodsList = [signal valueForKey:@"value"];
            self.hasUpdated = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                return nil;
            }];
        }];
    }
    return self;
}

- (NSMutableArray *)fetchData {
    return self.goodsList;
}


- (void)readDataFromFile:(void (^)(RACSignal *))completion {
    dispatch_queue_t queue = dispatch_queue_create("reading file", NULL);
    dispatch_async(queue, ^{
        NSMutableArray *goodsList = [[NSMutableArray alloc] init];
        NSMutableArray <Goods *> *booksList = [[NSMutableArray alloc] init];
        
        NSError *error;
        NSString *fileName = [[NSBundle mainBundle] pathForResource:@"goods" ofType:@"json"];
        NSData *dataFile = [NSData dataWithContentsOfFile:fileName options:NSDataReadingMappedAlways error:&error];
        
        if (error) {
            NSLog(@"%@", [error description]);
            completion(nil);
            return;
        }
        
        NSDictionary *goodsDictionary = [NSJSONSerialization JSONObjectWithData:dataFile
                                                                        options:NSJSONReadingMutableContainers
                                                                          error:&error];
        
        if (error) {
            NSLog(@"%@", [error description]);
            completion(nil);
            return;
        }
        
        NSArray<NSDictionary *> *booksArray = [goodsDictionary objectForKey:@"Books"];
        for (NSDictionary *item in booksArray) {
            Book *book;
            NSInteger bookType = ((NSNumber *)[item objectForKey:@"bookType"]).integerValue;
            
            switch (bookType) {
                case BookTypeProgramming: {
                    book = [[ProgrammingBook alloc]init];
                    ((ProgrammingBook *)book).programmingLanguage = [item objectForKey:@"programmingLanguage"];
                    break;
                }
                    
                case BookTypeCookery: {
                    book = [[CookeryBook alloc] init];
                    ((CookeryBook *)book).mainIngredient = [item objectForKey:@"mainIngredient"];
                    break;
                }
                    
                case BookTypeEsoteric: {
                    book = [[EsotericBook alloc] init];
                    ((EsotericBook *)book).minReaderAge = ((NSNumber *)[item objectForKey:@"minReaderAge"]).integerValue;
                    break;
                }
                    
                default:
                    continue;
            }
            
            book.name = [item objectForKey:@"name"];
            book.price = ((NSNumber *)[item objectForKey:@"price"]).integerValue;
            book.barCode = [item objectForKey:@"barCode"];
            book.imageURL = [NSURL URLWithString:[item objectForKey:@"imageURL"]];
            book.pagesCount = ((NSNumber *)[item objectForKey:@"pagesCount"]).integerValue;
            
            [booksList addObject:book];
        }
        
        [goodsList addObject:booksList];
        
        NSMutableArray<Goods *> *disksList = [[NSMutableArray alloc] init];
        NSArray<NSDictionary *> *disksArray = [goodsDictionary objectForKey:@"Disks"];
        for (NSDictionary *item in disksArray) {
            Disk *disk;
            
            NSInteger diskType = ((NSNumber *)[item objectForKey:@"diskType"]).integerValue;
            switch (diskType) {
                case DiskTypeCD:
                    disk = [[CompactDisk alloc] init];
                    break;
                    
                case DiskTypeDVD:
                    disk = [[DigitalVersatileDisk alloc] init];
                    break;
                    
                default:
                    continue;
            }
            
            
            disk.name = [item objectForKey:@"name"];
            disk.price = ((NSNumber *)[item objectForKey:@"price"]).integerValue;
            disk.barCode = [item objectForKey:@"barCode"];
            disk.imageURL = [NSURL URLWithString:[item objectForKey:@"imageURL"]];
            disk.contentType = ((NSNumber *)[item objectForKey:@"contentType"]).integerValue;
            
            [disksList addObject:disk];
        }
        
        [goodsList addObject:disksList];
        
        completion([RACSignal return:goodsList]);
    });
}
@end

