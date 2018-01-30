# Annecy Media iOS SDK

Use our [API docs](https://admin.annecy.media/docs) for an awesome integration experience!

## Prerequisites

* You need an Annecy Media account and token
	* [Register](https://admin.annecy.media/getting-started) or [Login](https://admin.annecy.media/login)
    * Create a **Token** in your [Publisher Settings](https://admin.annecy.media/publishers)
* Your target has to be at least **iOS 8.0**

## Sample

* Swift
	* [CocoaPods](https://github.com/gdmobile/annecy-media-ios-sdk/tree/master/SampleProject/SampleSwiftPods)
	* *Carthage (coming in February 2018)*
* Objective-C
	* *CocoaPods (coming in February 2018)*
	* *Carthage (coming in February 2018)*

## Installation


### CocoaPods

**CocoaPods** is a package manager for iOS projects. You can install it with this command in your Terminal:

``` bash
$ gem install cocoapods
```

Integrate Annecy Media SDK into your Xcode project using CocoaPods by creating a `Podfile` like this:


``` ruby
target '<Your Target Name>' do
	use_frameworks!
    pod 'AnnecyMediaSDK', :git => 'https://github.com/gdmobile/annecy-media-ios-sdk.git'
end
```

Install Annecy Media SDK by running this command in your Terminal, in the root directory of your project:

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
