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
    var spaceText : String

    init(_ labelText:String, spaceText: String, proxyDelegate: KeyboardViewControllerProxy) {
        self.spaceText = spaceText
        super.init(labelText, proxyDelegate: proxyDelegate)

        if #available(iOS 13, *) {
            self.backgroundColor = self.traitCollection.userInterfaceStyle == .dark ? UIColor.lightGray : UIColor.white
        } else {
            self.backgroundColor = UIColor.white
        }

        let defaultFontSize = self.buttonLabel.font.pointSize
        self.buttonLabel.font = self.buttonLabel.font.withSize(0.7*defaultFontSize)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func handleTap(_ recognizer: UITapGestureRecognizer) {
        if recognizer.state == .began {
            if #available(iOS 13, *) {
                self.backgroundColor = self.traitCollection.userInterfaceStyle == .dark ? UIColor.darkGray : UIColor.lightGray
            } else {
                self.backgroundColor = UIColor.lightGray
            }

            self.playInputClick(soundId: self.modifierSoundId)
            self.proxyDelegate.insertText(buttonText: self.spaceText)
        } else if recognizer.state == .ended {
            if #available(iOS 13, *) {
                self.backgroundColor = self.traitCollection.userInterfaceStyle == .dark ? UIColor.lightGray : UIColor.white
            } else {
                self.backgroundColor = UIColor.white
            }
        }
    }
}

