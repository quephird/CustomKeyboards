//
//  Tappable.swift
//  CustomKeyboards
//
//  Created by danielle kefford on 12/12/17.
//  Copyright © 2017 danielle kefford. All rights reserved.
//

import UIKit

/// Protocol that declares all operations needed to be implemented
/// for responding to button taps.
@objc protocol Tappable {
    @objc func handleTap(_ recognizer: UITapGestureRecognizer)
}
