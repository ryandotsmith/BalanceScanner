# Chain

The Official iOS SDK for Chain's Bitcoin API.

## Install

Chain is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```
pod 'Chain', '0.1.1'
```

## Quick Start

```objc

Chain *chain = [Chain sharedInstanceWithToken:@"GUEST-TOKEN"];

NSString *address = @"1A3tnautz38PZL15YWfxTeh8MtuMDhEPVB";

[chain getAddress:address completionHandler:^(NSDictionary *dict, NSError *error) {
  NSLog(@"data=%@ error=%@", dict, error);
}];

[chain getUnspents:address completionHandler:^(NSDictionary *dict, NSError *error) {
  NSLog(@"data=%@ error=%@", dict, error);
}];

NSString *hex = @"<hex> representation of transaction";
[chain sendTransaction:hex completionHandler:^(NSDictionary *dict, NSError *error) {
  NSLog(@"data=%@ error=%@", dict, error);
}];

```
