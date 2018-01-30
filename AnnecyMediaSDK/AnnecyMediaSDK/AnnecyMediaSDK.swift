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
    
    @objc
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
    
    /// Set Token.
    ///
    /// - Parameter token: Annecy Media API token.
    /// - Parameter userId: Custom publisher user ID.
    @objc
    public func setOptions(token: String, userId: String) {
        options.token = token
        options.userId = userId
    }
    
    /// Request Annecy Media offerwall.
    @objc
    public func requestOfferwall() {
        viewController.requestOfferwall()
    }
}
