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
    @objc
    public func setToken(_ token: String) {
        options.token = token
    }
    
    /// Set user ID.
    ///
    /// - Parameter userId: Custom user ID.
    @objc
    public func setUserId(_ userId: String) {
        options.userId = userId
    }
    
    /// Set button background color.
    ///
    /// - Parameter buttonBackgroundColor: Button background color.
    @objc
    public func setButtonBackgroundColor(_ buttonBackgroundColor: String) {
        options.buttonBackgroundColor = buttonBackgroundColor
    }
    
    /// Set button text color.
    ///
    /// - Parameter buttonTextColor: Button text color.
    @objc
    public func setButtonTextColor(_ buttonTextColor: String) {
        options.buttonTextColor = buttonTextColor
    }
    
    /// Set headline.
    ///
    /// - Parameter headline: Headline.
    @objc
    public func setHeadline(_ headline: String) {
        options.headline = headline
    }
    
    /// Set header background color.
    ///
    /// - Parameter headerBackgroundColor: Header background color.
    @objc
    public func setHeaderBackgroundColor(_ headerBackgroundColor: String) {
        options.headerBackgroundColor = headerBackgroundColor
    }
    
    /// Set header text color.
    ///
    /// - Parameter headerTextColor: Header text color.
    @objc
    public func setHeaderTextColor(_ headerTextColor: String) {
        options.headerTextColor = headerTextColor
    }
    
    /// Set header button background color.
    ///
    /// - Parameter headerButtonBackgroundColor: Header button background color.
    @objc
    public func setHeaderButtonBackgroundColor(_ headerButtonBackgroundColor: String) {
        options.headerButtonBackgroundColor = headerButtonBackgroundColor
    }
    
    /// Set header button text color.
    ///
    /// - Parameter headerButtonTextColor: Header button text color.
    @objc
    public func setHeaderButtonTextColor(_ headerButtonTextColor: String) {
        options.headerButtonTextColor = headerButtonTextColor
    }
    
    /// Set is header enabled.
    ///
    /// - Parameter isHeaderEnabled: Is header enabled.
    @objc
    public func setIsHeaderEnabled(_ isHeaderEnabled: Bool) {
        options.isHeaderEnabled = isHeaderEnabled
    }
    
    /// Request Annecy Media offerwall.
    @objc
    public func requestOfferwall() {
        viewController.requestOfferwall()
    }
}
