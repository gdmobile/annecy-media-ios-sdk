//
//  ViewController.swift
//  DebugProjectSwift
//
//  Created by Tobias Schultka on 30.01.18.
//  Copyright © 2018 GD Mobile GmbH. All rights reserved.
//

import UIKit
import AnnecyMediaSDK

class ViewController: UIViewController, AMSDKDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AnnecyMediaSDK.instance.delegate = self
        AnnecyMediaSDK.instance.options.token = "6ce0bbf0-2dc8-4d7c-a497-e93105188ba1"
        AnnecyMediaSDK.instance.options.userId = "foo"
        
        // Optinal options
        AnnecyMediaSDK.instance.options.buttonBackgroundColor = "FCD"
        AnnecyMediaSDK.instance.options.buttonTextColor = "000"
        AnnecyMediaSDK.instance.options.isHeaderEnabled = true
        AnnecyMediaSDK.instance.options.headline = "Your Offerwall"
        AnnecyMediaSDK.instance.options.headerBackgroundColor = "DCF"
        AnnecyMediaSDK.instance.options.headerTextColor = "333"
        AnnecyMediaSDK.instance.options.headerButtonBackgroundColor = "98C"
        AnnecyMediaSDK.instance.options.headerButtonTextColor = "FFF"
        
        AnnecyMediaSDK.instance.requestOfferwall()
    }
    
    func annecyOnOfferwallReady(viewController: AMSDKViewController) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
