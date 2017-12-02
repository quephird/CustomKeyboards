//
//  Keyboard.swift
//  CustomKeyboards
//
//  Created by danielle kefford on 11/30/17.
//  Copyright © 2017 danielle kefford. All rights reserved.
//

import UIKit

class Keyboard {
    let topMargin = CGFloat(10.0)
    let bottomMargin = CGFloat(10.0)
    let leftMargin = CGFloat(5.0)
    let rightMargin = CGFloat(5.0)

    let horizontalSpaceBetweenButtons = CGFloat(7.0)
    let verticalSpaceBetweenButtons = CGFloat(10.0)

    var keyboardWidth : CGFloat
    var keyboardHeight : CGFloat

    var buttonWidth : CGFloat
    var buttonHeight : CGFloat

    var letterRows : [[String]]

    init(_ letterRows : [[String]]) {
        self.letterRows = letterRows
        
        self.keyboardWidth = CGFloat(320.0)
        self.keyboardHeight = CGFloat(226.0)

        self.buttonWidth = self.keyboardWidth
            - CGFloat(self.letterRows[0].count-1)*horizontalSpaceBetweenButtons
            - self.leftMargin
            - self.rightMargin
        self.buttonHeight = (self.keyboardHeight - topMargin - bottomMargin - 3*self.verticalSpaceBetweenButtons)/4.0
    }
}
