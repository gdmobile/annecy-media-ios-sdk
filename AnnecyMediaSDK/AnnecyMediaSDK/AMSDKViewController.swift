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
        
        self.view.backgroundColor = .white
        self.modalTransitionStyle = .coverVertical
    }
    
    /// Request offerwall.
    internal func requestOfferwall() {
        let offerwallWebView = UIWebView(frame: self.view.bounds)
        
        offerwallWebView.delegate = self
        offerwallWebView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        offerwallWebView.isMultipleTouchEnabled = false
        offerwallWebView.backgroundColor = .white
        
        if #available(iOS 9, *) {
            offerwallWebView.allowsLinkPreview = false
            offerwallWebView.allowsPictureInPictureMediaPlayback = false
        }
        
        if let offerwallURL = AnnecyMediaSDK.instance.options.offerwallUrl {
            let offerwallURLRequest:URLRequest = URLRequest(url: offerwallURL)
            offerwallWebView.loadRequest(offerwallURLRequest)
        }
        
        if let backgroundColor = UIColor(hexString: AnnecyMediaSDK.instance.options.headerBackgroundColor) {
            offerwallWebView.backgroundColor = backgroundColor
        }
        
        self.view.addSubview(offerwallWebView)
    }
    
    /// On user clicked inside the offerwall.
    ///
    /// - Parameter url: URL of the clicked link.
    fileprivate func onOfferwallClicked(url: URL) {
        if let hashIndex = url.absoluteString.index(of: "#") {
            let hash = url.absoluteString[hashIndex...]
            if (hash == "#annecy-back") {
                AnnecyMediaSDK.instance.delegate?.annecyOnCloseOfferwall?(viewController: self)
                
                return
            }
        }
        
        if UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
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
                onOfferwallClicked(url: url)
            }
            
            return false
        }
        
        return true
    }
    
    /// Annecy did appear.
    ///
    /// - Parameter animated: Is animated.
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AnnecyMediaSDK.instance.delegate?.annecyDidShowOfferwall?()
    }
    
    /// Annecy will disappear.
    ///
    /// - Parameter animated: Is animated.
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        AnnecyMediaSDK.instance.delegate?.annecyWillDismissOfferwall?()
    }
    
    /// Annecy will appear.
    ///
    /// - Parameter animated: Is animated.
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AnnecyMediaSDK.instance.delegate?.annecyWillShowOfferwall?()
    }
    
    /// Annecy did disappear.
    ///
    /// - Parameter animated: Is animated.
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AnnecyMediaSDK.instance.delegate?.annecyDidDismissOfferwall?()
    }
    
    /// Prefers status bar hidden.
    public override var prefersStatusBarHidden: Bool {
        if #available(iOS 11.0, *) {
            if (UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0 > 0) {
                return false
            }
        }
        
        return true
    }
    
    /// Modal presentation style.
    public override var modalPresentationStyle: UIModalPresentationStyle {
        get {return .fullScreen}
        set {}
    }
}
