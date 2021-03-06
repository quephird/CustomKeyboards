//
//  ReturnButton.swift
//  CustomKeyboards
//
//  Created by danielle kefford on 12/26/17.
//  Copyright © 2017 danielle kefford. All rights reserved.
//

import UIKit

/// Specialized class for the spacebar
class ReturnButton : KeyboardButton {
    override init(_ labelText: String, proxyDelegate: KeyboardViewControllerProxy) {
        super.init(labelText, proxyDelegate: proxyDelegate)

        if #available(iOS 13, *) {
            self.backgroundColor = self.traitCollection.userInterfaceStyle == .dark ? UIColor.darkGray : UIColor.gray
        } else {
            self.backgroundColor = UIColor.gray
        }
        self.layer.borderWidth = 0.0
        let defaultFontSize = self.buttonLabel.font.pointSize
        self.buttonLabel.font = self.buttonLabel.font.withSize(0.7*defaultFontSize)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func handleTap(_ recognizer: UITapGestureRecognizer) {
        if recognizer.state == .began {
            self.backgroundColor = UIColor.init(white: 1, alpha: 1)
            self.playInputClick(soundId: self.modifierSoundId)
            self.proxyDelegate.insertText(buttonText: "\n")
        } else if recognizer.state == .ended {
            self.backgroundColor = UIColor.init(white: 0.8, alpha: 1)
        }
    }
}
