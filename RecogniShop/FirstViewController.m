//
//  FirstViewController.m
//  RecogniShop
//
//  Created by Daniel López on 08/04/13.
//  Copyright (c) 2013 Daniel López. All rights reserved.
//

#import "FirstViewController.h"
#import "ProductViewController.h"

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

@interface FirstViewController ()

@end

@implementation FirstViewController

@synthesize button;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendURL:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    NSString *buttonTitle = theButton.titleLabel.text;
    NSString *buttonID = [buttonTitle substringFromIndex:[buttonTitle length]-1];
    NSString *theString = [[NSString alloc] initWithFormat:@"http://localhost:4567/product/%@",buttonID];
    NSURL *sendThisURL = [[NSURL alloc] initWithString:theString];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{NSData *data = [NSData dataWithContentsOfURL:sendThisURL];
        [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data waitUntilDone:YES];
    });
    
}

- (void)fetchedData:(NSData *)responseData {
    NSError *error;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    
    NSLog(@"%@",[json objectForKey:@"content"]);

    NSString *name = [[json objectForKey:@"content"] objectForKey:@"name"];
    NSNumber *stock = [[json objectForKey:@"content"] objectForKey:@"stock"];
    
    NSLog(@"%@",name);
    NSLog(@"%@",stock);
    
    ProductViewController *productVC = [[ProductViewController alloc] initWithName:name stock:stock];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:productVC];
    [self presentViewController:navController animated:YES completion:nil];
}
@end
