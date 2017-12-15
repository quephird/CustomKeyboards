//
//  LetterButton.swift
//  CustomKeyboards
//
//  Created by danielle kefford on 12/12/17.
//  Copyright © 2017 danielle kefford. All rights reserved.
//

import UIKit

class LetterButton : KeyboardButton {
    override func handleTap(_ recognizer: UITapGestureRecognizer) {
        self.playInputClick(soundId: self.clickSoundId)
        self.documentProxyDelegate.insertText(buttonText: labelText)
    }
}
