//
//  ProductViewController.m
//  RecogniShop
//
//  Created by Daniel López on 08/04/13.
//  Copyright (c) 2013 Daniel López. All rights reserved.
//

#import "ProductViewController.h"

@interface ProductViewController ()

@end

@implementation ProductViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UIBarButtonItem *closeButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(close)];
        self.navigationItem.rightBarButtonItem = closeButton;
    }
    return self;
}

- (id)initWithName:(NSString *)name stock:(NSNumber *)stock {
    self = [super init];
    if (self) {
        _name = name;
        _stock = stock;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = _name;
    _stockLabel.text = _stock.stringValue;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)close {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end
