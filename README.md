# Annecy Media iOS SDK

Use our [API docs](https://admin.annecy.media/docs) for an awesome integration experience!

## Checklist

* You have an Annecy Media account and token
    * [Register](https://admin.annecy.media/getting-started) or [Login](https://admin.annecy.media/login)
    * Create a **Token** in your [Publisher Settings](https://admin.annecy.media/publishers)
* Your deployment target is at least **iOS 8.0**

## Sample

* Swift
    * [CocoaPods](https://github.com/gdmobile/annecy-media-ios-sdk/tree/master/SampleProject/SampleSwiftPods)
    * *Carthage (coming in February 2018)*
* Objective-C
    * [CocoaPods](https://github.com/gdmobile/annecy-media-ios-sdk/tree/master/SampleProject/SampleObjCPods)
    * *Carthage (coming in February 2018)*

## Installation

### CocoaPods

**CocoaPods** is a package manager for iOS projects. You can install it with this command in your Terminal:

``` bash
$ gem install cocoapods
```

Integrate Annecy Media SDK into your Xcode project by creating a `Podfile` like this:


``` ruby
target '<Your Target Name>' do
    use_frameworks!
    pod 'AnnecyMediaSDK', :git => 'https://github.com/gdmobile/annecy-media-ios-sdk.git'
end
```

Install Annecy Media SDK by running this command in the root directory of your project:

```bash
$ pod install
```

## Usage

### Swift

This is how your `ViewController.swift` could look like:

``` swift
import UIKit
import AnnecyMediaSDK

class ViewController: UIViewController, AMSDKDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()

        AnnecyMediaSDK.instance.delegate = self
        AnnecyMediaSDK.instance.options.token = "6ce0bbf0-2dc8-4d7c-a497-e93105188ba1"
        AnnecyMediaSDK.instance.options.userId = "foo"
        AnnecyMediaSDK.instance.requestOfferwall()
    }

    func annecyOnOfferwallReady(viewController: AMSDKViewController) {
        self.present(viewController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
```

### Objective-C

This is how your `ViewController.h` could look like:

``` objective-c
#import <UIKit/UIKit.h>
#import <AnnecyMediaSDK/AnnecyMediaSDK-Swift.h>

@interface ViewController: UIViewController<AMSDKDelegate>

@end
```

And this is how your `ViewController.m` could look like:

``` objective-c
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

AnnecyMediaSDK* annecyMediaSDK;
NSString* TOKEN = @"6ce0bbf0-2dc8-4d7c-a497-e93105188ba1";
NSString* USER_ID = @"foo";

- (void)viewDidLoad {
    [super viewDidLoad];

    annecyMediaSDK = AnnecyMediaSDK.instance;
    annecyMediaSDK.delegate = self;
    [annecyMediaSDK setOptionsWithToken:TOKEN userId:USER_ID];
    [annecyMediaSDK requestOfferwall];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)annecyOnOfferwallReadyWithViewController:(AMSDKViewController * _Nonnull)viewController {
    [self presentViewController:viewController animated:YES completion:nil];
}

@end
```

### Delegate Functions

Mandatory callbacks:
``` swift
func annecyOnOfferwallReady(viewController: AMSDKViewController) {}
```

Optionals callbacks:
``` swift
func annecyDidRequestOfferwall() {}
func annecyDidShowOfferwall() {}
func annecyDidDismissOfferwall() {}
func annecyOnOfferwallFailed(error: Error) {}
```
