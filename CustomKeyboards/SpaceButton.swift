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
        let defaultFontSize = self.buttonLabel.font.pointSize
        self.buttonLabel.font = self.buttonLabel.font.withSize(0.7*defaultFontSize)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func handleTap(_ recognizer: UITapGestureRecognizer) {
        self.playInputClick(soundId: self.modifierSoundId)
        self.proxyDelegate.insertText(buttonText: self.spaceText)
    }
}

