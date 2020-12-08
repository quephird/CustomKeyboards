//
//  KeyboardViewController.swift
//
//  Created by danielle kefford on 12/09/17.
//  Copyright © 2017 danielle kefford. All rights reserved.
//

import UIKit

/// This is a superclass for all keyboard view controllers, and is
/// fully responsible for laying out the entire keyboard, as well
/// as mutating the underlying text document.
class KeyboardViewController: UIInputViewController {
    // TODO: Figure out how to remove the need to have references to all these things except the keyboard and letterButtons objects
    var letterButtonKeyRows : [[(String, String)]]!
    var deleteButtonLabel : String!
    var returnButtonLabel : String!
    var shiftButtonLabel : String!
    var spaceButtonText : String!
    var spaceButtonLabel : String!
    var keyboard : Keyboard!
    var letterButtons : [LetterButton]!

    func makeButtonRow(_ buttonKeys: [(String, String)]) -> [LetterButton] {
        let newButtons = buttonKeys.map { LetterButton($0, proxyDelegate: self) }
        return newButtons
    }

    func makeLetterButtons() {
        let letterButtonRows = letterButtonKeyRows.map { makeButtonRow($0) }
        self.letterButtons = Array(letterButtonRows.joined())

        for (rowIndex, buttonRow) in letterButtonRows.enumerated() {
            for (buttonIndex, button) in buttonRow.enumerated() {
                // Note that we need to indent each key based on the _total_ number
                // of keys in the row, not just its index, hence the extra accounting.
                let x = self.keyboard.leftMargin +
                    CGFloat(buttonIndex)*self.keyboard.horizontalSpaceBetweenButtons +
                    CGFloat(buttonIndex)*self.keyboard.buttonWidth +
                    CGFloat(10 - buttonRow.count)*0.5*self.keyboard.horizontalSpaceBetweenButtons +
                    CGFloat(10 - buttonRow.count)*0.5*self.keyboard.buttonWidth
                let y = self.keyboard.topMargin +
                    CGFloat(rowIndex)*self.keyboard.verticalSpaceBetweenButtons +
                    CGFloat(rowIndex)*self.keyboard.buttonHeight
                let width = 1.0*self.keyboard.buttonWidth
                let height = 1.0*self.keyboard.buttonHeight
                button.frame = CGRect(x: x, y: y, width: width, height: height)
                self.view.addSubview(button)
            }
        }
    }

    func makeShiftButton() {
        let shiftKey = ShiftButton(self.shiftButtonLabel, proxyDelegate: self)
        let x = self.keyboard.leftMargin
        let y = self.keyboard.topMargin +
            2.0*self.keyboard.buttonHeight +
            2.0*self.keyboard.verticalSpaceBetweenButtons
        let width = 1.0*self.keyboard.buttonHeight
        let height = 1.0*self.keyboard.buttonHeight
        shiftKey.frame = CGRect(x: x, y: y, width: width, height: height)
        self.view.addSubview(shiftKey)
    }

    func makeBackspaceButton() {
        let backspace = BackspaceButton(self.deleteButtonLabel, proxyDelegate: self)
        let x = self.keyboard.leftMargin +
            8.5*self.keyboard.buttonWidth +
            9.0*self.keyboard.horizontalSpaceBetweenButtons
        let y = self.keyboard.topMargin +
            2.0*self.keyboard.buttonHeight +
            2.0*self.keyboard.verticalSpaceBetweenButtons
        let width = 1.0*self.keyboard.buttonHeight
        let height = 1.0*self.keyboard.buttonHeight
        backspace.frame = CGRect(x: x, y: y, width: width, height: height)
        self.view.addSubview(backspace)
    }

    func makeNextKeyboardButton() {
        let nextKeyboard = NextKeyboardButton("🌐", proxyDelegate: self)
        let x = self.keyboard.leftMargin +
            1.0*self.keyboard.buttonHeight +
            1.0*self.keyboard.horizontalSpaceBetweenButtons
        let y = self.keyboard.topMargin +
            3.0*self.keyboard.buttonHeight +
            3.0*self.keyboard.verticalSpaceBetweenButtons
        let width = 1.0*self.keyboard.buttonHeight
        let height = 1.0*self.keyboard.buttonHeight
        nextKeyboard.frame = CGRect(x: x, y: y, width: width, height: height)
        self.view.addSubview(nextKeyboard)
   }

    func makeSpaceButton() {
        let spacebar = SpaceButton(self.spaceButtonLabel, spaceText: self.spaceButtonText, proxyDelegate: self)
        let x = self.keyboard.leftMargin +
            3.5*self.keyboard.buttonWidth +
            3.5*self.keyboard.horizontalSpaceBetweenButtons
        let y = self.keyboard.topMargin +
            3.0*self.keyboard.buttonHeight +
            3.0*self.keyboard.verticalSpaceBetweenButtons
        let width = 4.0*self.keyboard.buttonWidth +
            3.0*self.keyboard.horizontalSpaceBetweenButtons
        let height = 1.0*self.keyboard.buttonHeight
        spacebar.frame = CGRect(x: x, y: y, width: width, height: height)
        self.view.addSubview(spacebar)
    }

    func makeReturnButton() {
        let returnKey = ReturnButton(self.returnButtonLabel, proxyDelegate: self)
        let x = self.keyboard.leftMargin +
            7.5*self.keyboard.buttonWidth +
            7.5*self.keyboard.horizontalSpaceBetweenButtons
        let y = self.keyboard.topMargin +
            3.0*self.keyboard.verticalSpaceBetweenButtons +
            3.0*self.keyboard.buttonHeight
        let width = 3.0*self.keyboard.buttonWidth
        let height = 1.0*self.keyboard.buttonHeight
        returnKey.frame = CGRect(x: x, y: y, width: width, height: height)
        self.view.addSubview(returnKey)
    }

    func makeKeyboard() {
        self.keyboard = Keyboard(UIScreen.main.bounds.width)

        self.makeLetterButtons()
        self.makeShiftButton()
        self.makeBackspaceButton()
        self.makeNextKeyboardButton()
        self.makeSpaceButton()
        self.makeReturnButton()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        self.makeKeyboard()
        // This disables all autolayout because we want to layout everything manually
        for constraint in self.view.constraints {
             constraint.isActive = false
        }
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
}

extension KeyboardViewController : KeyboardViewControllerProxy {
    func insertText(buttonText: String) {
        self.textDocumentProxy.insertText(buttonText)
    }

    func deleteText() {
        self.textDocumentProxy.deleteBackward()
    }

    func advanceToNextKeyboard() {
        self.advanceToNextInputMode()
    }

    func toggleCase() {
        for button in self.letterButtons {
            button.switchMode()
        }
    }
}
