//
//  NextKeyboardButton.swift
//  CustomKeyboards
//
//  Created by danielle kefford on 12/16/17.
//  Copyright © 2017 danielle kefford. All rights reserved.
//

import UIKit

/// Specialized class for the next keyboard button
class NextKeyboardButton : KeyboardButton {
    override init(_ labelText: String, proxyDelegate: KeyboardViewControllerProxy) {
        super.init(labelText, proxyDelegate: proxyDelegate)

        if #available(iOS 13, *) {
            self.backgroundColor = self.traitCollection.userInterfaceStyle == .dark ? UIColor.darkGray : UIColor.gray
        } else {
            self.backgroundColor = UIColor.gray
        }

        self.layer.borderWidth = 0.0
        self.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:))))
    }

    // Needed to keep XCode happy
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func handleTap(_ recognizer: UITapGestureRecognizer) {
        if recognizer.state == .began {
            self.playInputClick(soundId: self.modifierSoundId)
            self.proxyDelegate.advanceToNextKeyboard()
        } else if recognizer.state == .ended {
            self.backgroundColor = UIColor.init(white: 0.8, alpha: 1)
        }
    }

    @objc func handleLongPress(_ recognizer: UILongPressGestureRecognizer) {
        self.playInputClick(soundId: self.modifierSoundId)
    }
}
