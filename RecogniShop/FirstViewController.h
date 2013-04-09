//
//  FirstViewController.h
//  RecogniShop
//
//  Created by Daniel López on 08/04/13.
//  Copyright (c) 2013 Daniel López. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController {
    UIButton *button;
}

@property (nonatomic, strong) UIButton *button;
- (IBAction)sendURL:(id)sender;

@end
