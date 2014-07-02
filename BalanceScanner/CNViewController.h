#import <UIKit/UIKit.h>
#import "CDZQRScanningViewController.h"
#import "Chain.h"

@interface CNViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *balanceLabel;
@property (weak, nonatomic) UIButton *cancelButton;
@property (weak, nonatomic) CDZQRScanningViewController *qrc;

- (IBAction)scanAction:(id)sender;
@end
