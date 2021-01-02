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

        if #available(iOS 13, *) {
            self.backgroundColor = self.traitCollection.userInterfaceStyle == .dark ? UIColor.lightGray : UIColor.white
        } else {
            self.backgroundColor = UIColor.white
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func handleTap(_ recognizer: UIGestureRecognizer) {
        if recognizer.state == .began {
            // Popup key
            self.frame.origin.y = self.frame.origin.y - self.frame.size.height*1.5
            self.frame.size.height = self.frame.size.height * 2.5
            self.frame.origin.x = self.frame.origin.x

            // Move label up and make bigger
            self.buttonLabel.translatesAutoresizingMaskIntoConstraints = true
            self.removeConstraints(self.constraints)
            self.buttonLabel.font = self.buttonLabel.font.withSize(20)
            self.buttonLabel.removeConstraints(self.buttonLabel.constraints)
            self.buttonLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
            self.buttonLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            self.buttonLabel.translatesAutoresizingMaskIntoConstraints = false

            self.playInputClick(soundId: self.clickSoundId)
            self.proxyDelegate.insertText(buttonText: self.buttonLabel.text!)
        } else if recognizer.state == .ended {
            // Make key regular size again
            self.frame.origin.y = self.frame.origin.y + self.frame.size.height*0.6
            self.frame.size.height = self.frame.size.height / 2.5

            // Return label back to normal state
            self.buttonLabel.translatesAutoresizingMaskIntoConstraints = true
            self.buttonLabel.removeConstraints(self.buttonLabel.constraints)
            self.buttonLabel.font = self.buttonLabel.font.withSize(14)
            self.buttonLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            self.buttonLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            self.buttonLabel.translatesAutoresizingMaskIntoConstraints = false
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
