//
//  AMSDKViewController.swift
//  AnnecyMediaSDK
//
//  Created by Tobias Schultka on 30.01.18.
//  Copyright © 2018 GD Mobile GmbH. All rights reserved.
//

import Foundation
import UIKit
import AdSupport

public class AMSDKViewController: UIViewController, UIWebViewDelegate {
    
    /// Initialize Annecy View Controller.
    public init() {
        super.init(nibName: nil, bundle: nil)
        
        self.view.backgroundColor = UIColor.gray
        self.modalTransitionStyle = .coverVertical
    }
    
    /// Request offerwall.
    internal func requestOfferwall() {
        let frame = CGRect(
            x: 0,
            y: 0,
            width: UIScreen.main.bounds.width,
            height: UIScreen.main.bounds.height
        )
        
        let offerwallWebVew: UIWebView = UIWebView(frame: frame)
        self.view.addSubview(offerwallWebVew)
        offerwallWebVew.delegate = self
        
        if let offerwallURL = AnnecyMediaSDK.instance.options.offerwallUrl {
            let offerwallURLRequest:URLRequest = URLRequest(url: offerwallURL)
            offerwallWebVew.loadRequest(offerwallURLRequest)
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    /// Offerwall is ready.
    public func webViewDidFinishLoad(_ webView: UIWebView) {
        AnnecyMediaSDK.instance.delegate?.annecyOnOfferwallReady(viewController: self)
    }
    
    /// Offerwall is loading.
    public func webViewDidStartLoad(_ webView: UIWebView) {
        AnnecyMediaSDK.instance.delegate?.annecyDidRequestOfferwall?()
    }
    
    /// Offerwall failed loading.
    public func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        AnnecyMediaSDK.instance.delegate?.annecyOnOfferwallFailed?(error: error)
    }
    
    /// Detect click in offerwall.
    public func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if navigationType == .linkClicked {
            if let url = request.url {
                if UIApplication.shared.canOpenURL(url) {
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                }
            }
            
            return false
        }
        
        return true
    }
    
    /// Annecy did appear.
    ///
    /// - Parameter animated: Is animated.
    public override func viewDidAppear(_ animated: Bool) {
        AnnecyMediaSDK.instance.delegate?.annecyDidShowOfferwall?()
        
        super.viewDidAppear(animated)
    }
    
    /// Annecy did disappear.
    ///
    /// - Parameter animated: Is animated.
    public override func viewDidDisappear(_ animated: Bool) {
        AnnecyMediaSDK.instance.delegate?.annecyDidDismissOfferwall?()
        
        super.viewDidAppear(animated)
    }
    
    /// Modal presentation style.
    public override var modalPresentationStyle: UIModalPresentationStyle {
        get {return .fullScreen}
        set {}
    }
}
