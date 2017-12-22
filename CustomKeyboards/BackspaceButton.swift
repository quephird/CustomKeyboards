//
//  BackspaceButton.swift
//  CustomKeyboards
//
//  Created by danielle kefford on 12/13/17.
//  Copyright © 2017 danielle kefford. All rights reserved.
//

import UIKit

/// Specialized class for the backspace button
class BackspaceButton : KeyboardButton {
    override func handleTap(_ recognizer: UITapGestureRecognizer) {
        // TODO: Figure out how to set pressed and unpressed colors
        // self.backgroundColor = UIColor.init(white: 0.5, alpha: 1)
        self.playInputClick(soundId: self.deleteSoundId)
        self.proxyDelegate.deleteText()
    }
}
