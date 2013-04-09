//
//  ProductViewController.h
//  RecogniShop
//
//  Created by Daniel López on 08/04/13.
//  Copyright (c) 2013 Daniel López. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *stockLabel;
@property (weak, nonatomic) NSString *name;
@property (weak, nonatomic) NSNumber *stock;

- (id)initWithName:(NSString *)name stock:(NSNumber *)stock;

@end
