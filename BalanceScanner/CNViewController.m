#import "CNViewController.h"

@implementation CNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)scanAction:(id)sender
{
    [self initQr];
}

- (void)initQr
{
    CDZQRScanningViewController *scanningVC = [CDZQRScanningViewController new];
    scanningVC.resultBlock = ^(NSString *result) {
        [self handleNewAddress:result];
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    scanningVC.cancelBlock = ^() {
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    scanningVC.errorBlock = ^(NSError *error) {
        [self dismissViewControllerAnimated:YES completion:nil];
    };

    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton setFrame:CGRectMake(0, 0, 70, 70)];
    [cancelButton setImageEdgeInsets:UIEdgeInsetsMake(20, 20, 0, 0)];
    [cancelButton setImage:[UIImage imageNamed:@"button-background-cancel"] forState:UIControlStateNormal];
    [cancelButton setImage:[UIImage imageNamed:@"button-background-cancel-highlighted"] forState:UIControlStateHighlighted];
    [cancelButton addTarget:self action:@selector(dismissQr) forControlEvents:UIControlEventTouchDown];

    [self presentViewController:scanningVC animated:YES completion:^{
        [scanningVC.view addSubview:cancelButton];
    }];
    [self setQrc:scanningVC];
}

- (void)dismissQr
{
    [self.qrc dismissViewControllerAnimated:YES completion:nil];
    [self setQrc:nil];
}

- (void)handleNewAddress:(NSString *)address
{
    NSLog(@"processing-address=%@", address);
    [[Chain sharedInstance] getAddress:address completionHandler:^(NSDictionary *dictionary, NSError *error) {
        long btc = [[dictionary objectForKey:@"balance"] longLongValue] / 100000000.0;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.balanceLabel setText:[NSString stringWithFormat:@"Balance: %ld", btc]];
        });
    }];
}

@end
