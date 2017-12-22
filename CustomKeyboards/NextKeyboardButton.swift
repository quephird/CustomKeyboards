//
//  NextKeyboardButton.swift
//  CustomKeyboards
//
//  Created by danielle kefford on 12/16/17.
//  Copyright © 2017 danielle kefford. All rights reserved.
//

import UIKit

/// Specialized class for the backspace button
class NextKeyboardButton : KeyboardButton {
    override func handleTap(_ recognizer: UITapGestureRecognizer) {
        self.playInputClick(soundId: self.modifierSoundId)
        self.proxyDelegate.advanceToNextKeyboard()
    }
}
