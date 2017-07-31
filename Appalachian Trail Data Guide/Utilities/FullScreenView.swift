//
//  FullScreenView.swift
//  Appalachian Trail Data Guide
//
//  Created by Joseph Pecoraro on 4/29/17.
//  Copyright © 2017 Joseph Pecoraro. All rights reserved.
//

import UIKit
import SnapKit

protocol FullScreenView { }

extension FullScreenView where Self: UIView {
    func fullScreenLayout(superview: UIView) {
        superview.addSubview(self)
        
        self.snp.makeConstraints { (make) in
            make.top.equalTo(superview)
            make.bottom.equalTo(superview)
            make.left.equalTo(superview)
            make.right.equalTo(superview)
        }
    }
}

extension UIView : FullScreenView { }
