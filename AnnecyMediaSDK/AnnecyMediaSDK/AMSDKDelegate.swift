//
//  AMSDKDelegate.swift
//  AnnecyMediaSDK
//
//  Created by Tobias Schultka on 30.01.18.
//  Copyright © 2018 GD Mobile GmbH. All rights reserved.
//

import Foundation

@objc
public protocol AMSDKDelegate: class {
    
    /// The requested offerwall is ready to show.
    @objc func annecyOnOfferwallReady(viewController: AMSDKViewController)
    
    /// The app requested an offerwall.
    @objc optional func annecyDidRequestOfferwall()
    /// The app showed an offerwall.
    @objc optional func annecyDidShowOfferwall()
    /// The app dismissed an offerwall.
    @objc optional func annecyDidDismissOfferwall()
}

