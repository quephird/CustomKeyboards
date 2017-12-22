//
//  Keyboard.swift
//  CustomKeyboards
//
//  Created by danielle kefford on 11/30/17.
//  Copyright © 2017 danielle kefford. All rights reserved.
//

import UIKit

/// For the time being, this class simply computes and holds various constants
/// for laying out the buttons of the keyboard.
class Keyboard {
    let topMargin = CGFloat(10.0)
    let bottomMargin = CGFloat(10.0)
    let leftMargin = CGFloat(5.0)
    let rightMargin = CGFloat(5.0)

    let horizontalSpaceBetweenButtons = CGFloat(7.0)
    let verticalSpaceBetweenButtons = CGFloat(10.0)

    var keyboardWidth : CGFloat!
    var keyboardHeight : CGFloat!

    var buttonWidth : CGFloat!
    var buttonHeight : CGFloat!

    init(_ width: CGFloat) {
        self.keyboardWidth = width
        self.keyboardHeight = CGFloat(226.0)

        self.buttonWidth = (self.keyboardWidth
            - 9*self.horizontalSpaceBetweenButtons
            - self.leftMargin
            - self.rightMargin)/10.0
        self.buttonHeight = (self.keyboardHeight - topMargin - bottomMargin - 3*self.verticalSpaceBetweenButtons)/4.0
    }
}
