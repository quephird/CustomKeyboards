//
//  SpaceButton.swift
//  CustomKeyboards
//
//  Created by danielle kefford on 12/15/17.
//  Copyright © 2017 danielle kefford. All rights reserved.
//

import UIKit

/// Specialized class for the spacebar
class SpaceButton : KeyboardButton {
    override func handleTap(_ recognizer: UITapGestureRecognizer) {
        self.playInputClick(soundId: self.modifierSoundId)
        self.documentProxyDelegate.insertText(buttonText: labelText)
    }
}

