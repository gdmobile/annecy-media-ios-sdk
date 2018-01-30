//
//  AnnecyMediaSDK.swift
//  AnnecyMediaSDK
//
//  Created by Tobias Schultka on 30.01.18.
//  Copyright © 2018 GD Mobile GmbH. All rights reserved.
//

import Foundation

public class AnnecyMediaSDK: NSObject {
    fileprivate let viewController: AMSDKViewController
    
    public weak var delegate: AMSDKDelegate?
    public var options: AMSDKOptions
    
    @objc
    open static let instance = AnnecyMediaSDK()
    
    /// Initialize Annecy Media SDK.
    fileprivate override init() {
        viewController = AMSDKViewController()
        options = AMSDKOptions()
        super.init()
    }
    
    /// Request Annecy Media offerwall.
    public func requestOfferwall() {
        viewController.requestOfferwall()
    }
}
