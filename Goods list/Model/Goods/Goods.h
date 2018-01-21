//
//  Goods.h
//  Goods list
//
//  Created by Дмитрий Вашлаев on 13.01.18.
//  Copyright © 2018 Дмитрий Вашлаев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIImage.h>

@interface Goods : NSObject

@property (nonatomic, strong) NSString *name;
@property NSInteger price;
@property (nonatomic, strong) NSString *barCode;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSURL *imageURL;

- (NSString *)getAdditionalInfo;
- (NSString *)goodsCategory;

@end
