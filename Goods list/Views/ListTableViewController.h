//
//  ListTableViewController.h
//  Goods list
//
//  Created by Дмитрий Вашлаев on 13.01.18.
//  Copyright © 2018 Дмитрий Вашлаев. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListTVCViewModel.h"

@interface ListTableViewController : UITableViewController

@property (strong, nonatomic) ListTVCViewModel *viewModel;

@end
