//
//  DetailViewController.m
//  Goods list
//
//  Created by Дмитрий Вашлаев on 21.01.18.
//  Copyright © 2018 Дмитрий Вашлаев. All rights reserved.
//

#import "DetailViewController.h"
#import <ReactiveCocoa.h>

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initializeView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initializeView {
    @weakify(self);
    [RACObserve(self, viewModel) subscribeNext:^(id x) {
        @strongify(self);
        [[[self.viewModel getImage] deliverOnMainThread] subscribeNext:^(UIImage *x) {
            self.coverImage.image = x;
        }];
        
        self.navigationItem.title = [self.viewModel getName];
        self.priceLabel.text = [self.viewModel getPrice];
        self.barcodeLabel.text = [self.viewModel getBarcode];
        self.additionalInfoLabel.text = [self.viewModel getAdditionalInfo];
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
