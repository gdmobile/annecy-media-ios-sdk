//
//  AMSDKViewController.swift
//  AnnecyMediaSDK
//
//  Created by Tobias Schultka on 30.01.18.
//  Copyright © 2018 GD Mobile GmbH. All rights reserved.
//

import Foundation
import UIKit

public class AMSDKViewController: UIViewController {
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        
        self.view.backgroundColor = UIColor.gray
        self.modalTransitionStyle = .coverVertical
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    /// Annecy did appear.
    ///
    /// - Parameter animated: Is animated.
    open override func viewDidAppear(_ animated: Bool) {
        AnnecyMediaSDK.instance.delegate?.annecyDidShowOfferwall?()
        
        super.viewDidAppear(animated)
    }
    
    /// Annecy did disappear.
    ///
    /// - Parameter animated: Is animated.
    open override func viewDidDisappear(_ animated: Bool) {
        AnnecyMediaSDK.instance.delegate?.annecyDidDismissOfferwall?()
        
        super.viewDidAppear(animated)
    }
    
    /// Modal presentation style.
    ///
    /// - Parameter modalPresentationStyle: Modal presentation style.
    override open var modalPresentationStyle: UIModalPresentationStyle {
        get {return .fullScreen}
        set {}
    }
}
