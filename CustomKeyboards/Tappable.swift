//
//  TapHandler.swift
//  CustomKeyboards
//
//  Created by danielle kefford on 12/12/17.
//  Copyright © 2017 danielle kefford. All rights reserved.
//

import UIKit

@objc protocol Tappable {
    @objc func handleTap(_ recognizer: UITapGestureRecognizer)
}
