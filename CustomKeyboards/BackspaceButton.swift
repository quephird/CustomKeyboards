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
        if recognizer.state == .began {
            self.playInputClick(soundId: self.deleteSoundId)
            self.proxyDelegate.deleteText()
        }
    }
}
