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
    * [Carthage](https://github.com/gdmobile/annecy-media-ios-sdk/tree/master/SampleProject/SampleSwiftCarthage)
* Objective-C
    * [CocoaPods](https://github.com/gdmobile/annecy-media-ios-sdk/tree/master/SampleProject/SampleObjCPods)
    * [Carthage](https://github.com/gdmobile/annecy-media-ios-sdk/tree/master/SampleProject/SampleObjCCarthage)

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for macOS and iOS. You can install it with [RubyGems](https://rubygems.org) like this:

``` bash
$ gem install cocoapods
```

Create a `Podfile` like this:

``` ruby
target '<Your Target Name>' do
    use_frameworks!
    pod 'AnnecyMediaSDK', :git => 'https://github.com/gdmobile/annecy-media-ios-sdk.git'
end
```

You can add a `tag` with the version you like to use like this:

``` ruby
pod 'AnnecyMediaSDK', :git => 'https://github.com/gdmobile/annecy-media-ios-sdk.git', :tag => '1.0.0'
```

Run this command in the root directory of your project:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager for macOS and iOS. You can install it with [Homebrew](https://brew.sh) like this:

``` bash
$ brew install carthage
```

Create a `Cartfile` like this:

```
github "gdmobile/annecy-media-docs" "master"
```

You can replace `master` by the version you like to use e.g. `1.0.0`.

Run this command in the root directory of your project:

``` bash
$ carthage update
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
        AnnecyMediaSDK.instance.options.isHeaderEnabled = true
        AnnecyMediaSDK.instance.requestOfferwall()
    }

    func annecyOnOfferwallReady(viewController: AMSDKViewController) {
        self.present(viewController, animated: true, completion: nil)
    }

    func annecyOnCloseOfferwall(viewController: AMSDKViewController) {
        viewController.dismiss(animated: true, completion: nil)
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
    [annecyMediaSDK setToken:TOKEN];
    [annecyMediaSDK setUserId:USER_ID];
    [annecyMediaSDK setIsHeaderEnabled:YES];
    [annecyMediaSDK requestOfferwall];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)annecyOnOfferwallReadyWithViewController:(AMSDKViewController * _Nonnull)viewController {
    [self presentViewController:viewController animated:YES completion:nil];
}

- (void)annecyOnCloseOfferwallWithViewController:(AMSDKViewController *)viewController {
    [viewController dismissViewControllerAnimated:YES completion:nil];
}

@end
```

## Options

| Option                      | Type     | Example |
| --------------------------- | -------- | ------- |
| token                       | `String` | `"6ce0bbf0-2dc8-4d7c-a497-e93105188ba1"` |
| userId                      | `String` | `"foo"` |
| buttonBackgroundColor       | `String` | `"F00"` |
| buttonTextColor             | `String` | `"F00"` |
| isHeaderEnabled             | `Bool`   | `true` |
| headline                    | `String` | `"Your Offerwall"` |
| headerBackgroundColor       | `String` | `"F00"` |
| headerTextColor             | `String` | `"F00"` |
| headerButtonBackgroundColor | `String` | `"F00"` |
| headerButtonTextColor       | `String` | `"F00"` |

## Delegate Functions

Mandatory callbacks:
``` swift
func annecyOnOfferwallReady(viewController: AMSDKViewController) {}
```

Optional callbacks:
``` swift
func annecyDidRequestOfferwall() {}
func annecyDidShowOfferwall() {}
func annecyDidDismissOfferwall() {}
func annecyOnCloseOfferwall(viewController: AMSDKViewController) {}
func annecyOnOfferwallFailed(error: Error) {}
```
