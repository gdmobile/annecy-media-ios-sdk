//
//  ViewController.swift
//  SampleSwiftPods
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
        AnnecyMediaSDK.instance.requestOfferwall()
    }
    
    func annecyOnOfferwallReady(viewController: AMSDKViewController) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
