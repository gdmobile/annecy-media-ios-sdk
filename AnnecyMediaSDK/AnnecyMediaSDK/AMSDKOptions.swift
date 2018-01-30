//
//  AMSDKOptions.swift
//  AnnecyMediaSDK
//
//  Created by Tobias Schultka on 30.01.18.
//  Copyright © 2018 GD Mobile GmbH. All rights reserved.
//

import Foundation
import AdSupport

public class AMSDKOptions {
    
    public var token: String?
    public var userId: String?
    
    /// User country.
    internal var country: String? {
        get {
            return Locale.current.regionCode ?? nil
        }
    }
    
    /// User preferred language.
    internal var language: String? {
        get {
            return Locale.preferredLanguages.count != 0
                ? Locale.preferredLanguages[0]
                : nil
        }
    }
    
    /// User IDFA (Identifier for Advertisers).
    internal var idfa: String? {
        get {
            return ASIdentifierManager.shared().isAdvertisingTrackingEnabled
                ? ASIdentifierManager.shared().advertisingIdentifier.uuidString
                : nil
        }
    }
    
    /// User offerwall URL.
    internal var offerwallUrl: URL? {
        get {
            let urlString = "https://offerwall.annecy.media" +
                "?country=\(self.country ?? "")" +
                "&language=\(self.language ?? "")" +
                "&idfa_gaid=\(self.idfa ?? "")" +
                "&token=\(self.token ?? "")" +
                "&user_id=\(self.userId ?? "")" +
                "&platform=ios"
            
            return URL(string: urlString)
        }
    }
}
