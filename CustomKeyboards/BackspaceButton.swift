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
    override init(_ labelText: String, proxyDelegate: KeyboardViewControllerProxy) {
        super.init(labelText, proxyDelegate: proxyDelegate)

        if #available(iOS 13, *) {
            self.backgroundColor = self.traitCollection.userInterfaceStyle == .dark ? UIColor.darkGray : UIColor.gray
        } else {
            self.backgroundColor = UIColor.gray
        }

        self.layer.borderWidth = 0.0
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func handleTap(_ recognizer: UITapGestureRecognizer) {
        if recognizer.state == .began {
            if #available(iOS 13, *) {
                self.backgroundColor = self.traitCollection.userInterfaceStyle == .dark ? UIColor.white : UIColor.gray
            } else {
                self.backgroundColor = UIColor.gray
            }

            self.backgroundColor = UIColor.init(white: 1, alpha: 1)
            self.playInputClick(soundId: self.deleteSoundId)
            self.proxyDelegate.deleteText()
        } else if recognizer.state == .ended {
            if #available(iOS 13, *) {
                self.backgroundColor = self.traitCollection.userInterfaceStyle == .dark ? UIColor.darkGray : UIColor.gray
            } else {
                self.backgroundColor = UIColor.gray
            }
        }
    }
}
