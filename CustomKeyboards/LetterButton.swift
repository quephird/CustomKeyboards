//
//  LetterButton.swift
//  CustomKeyboards
//
//  Created by danielle kefford on 12/12/17.
//  Copyright © 2017 danielle kefford. All rights reserved.
//

import UIKit

/// Specialized class for all letter keys
class LetterButton : KeyboardButton {
    enum ButtonMode {
        case uppercase;
        case lowercase;
    }
    var letters : (String, String)!
    var buttonMode : ButtonMode
    
    init(_ letters: (String, String), proxyDelegate: KeyboardViewControllerProxy) {
        self.letters = letters
        self.buttonMode = ButtonMode.lowercase
        super.init(letters.0, proxyDelegate: proxyDelegate)
    }

    // Uuuugghhhhhhhh XCode needs this initializer
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func handleTap(_ recognizer: UIGestureRecognizer) {
        if recognizer.state == .began {
            self.frame.origin.y = self.frame.origin.y - self.frame.size.height
            self.frame.size.height = self.frame.size.height * 2
            self.frame.origin.x = self.frame.origin.x

            self.playInputClick(soundId: self.clickSoundId)
            self.proxyDelegate.insertText(buttonText: self.buttonLabel.text!)
        } else if recognizer.state == .ended {
            self.frame.origin.y = self.frame.origin.y + self.frame.size.height / 2
            self.frame.size.height = self.frame.size.height / 2
        }
    }

    func switchMode() {
        if (self.buttonMode == ButtonMode.lowercase) {
            self.buttonMode = ButtonMode.uppercase
            self.buttonLabel.text = self.letters.1
        } else {
            self.buttonMode = ButtonMode.lowercase
            self.buttonLabel.text = self.letters.0
        }
    }
}
