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
    
    public var buttonBackgroundColor: String?
    public var buttonTextColor: String?
    public var headline: String?
    public var headerBackgroundColor: String = "5A6267"
    public var headerTextColor: String?
    public var headerButtonBackgroundColor: String?
    public var headerButtonTextColor: String?
    public var isHeaderEnabled: Bool = false
    
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
                "&platform=ios" +
                "&btn_bg=\(self.buttonBackgroundColor ?? "")" +
                "&btn_txt=\(self.buttonTextColor ?? "")" +
                "&headline=\(self.getUrlEncoded(text: self.headline))" +
                "&hdr=\(self.isHeaderEnabled ? "1" : "")" +
                "&hdr_bg=\(self.headerBackgroundColor)" +
                "&hdr_txt=\(self.headerTextColor ?? "")" +
                "&hdr_btn_bg=\(self.headerButtonBackgroundColor ?? "")" +
                "&hdr_btn_txt=\(self.headerButtonTextColor ?? "")"
            
            return URL(string: urlString)
        }
    }
    
    /// Get URL encoded text.
    ///
    /// - Parameter text: Non encoded text.
    fileprivate func getUrlEncoded(text: String?) -> String {
        if (text != nil) {
            if let encodedText = text?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                return encodedText
            }
        }
    
        return ""
    }
}
