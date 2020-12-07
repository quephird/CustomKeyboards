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
                button.frame = CGRect(x: x, y: y, width: self.keyboard.buttonWidth, height: self.keyboard.buttonHeight)
                self.view.addSubview(button)
            }
        }
    }

    func makeShiftButton() {
        let shiftKey = ShiftButton(self.shiftButtonLabel, proxyDelegate: self)
        let bottomAnchorConstant = keyboard.buttonHeight + 2*keyboard.verticalSpaceBetweenButtons
        self.view.addSubview(shiftKey)
        shiftKey.heightAnchor.constraint(equalToConstant: self.keyboard.buttonHeight).isActive = true
        shiftKey.widthAnchor.constraint(equalToConstant: keyboard.buttonHeight).isActive = true
        shiftKey.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: keyboard.leftMargin).isActive = true
        shiftKey.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -bottomAnchorConstant).isActive = true
    }

    func makeBackspaceButton() {
        let backspace = BackspaceButton(self.deleteButtonLabel, proxyDelegate: self)
        let bottomAnchorConstant = keyboard.buttonHeight + 2*keyboard.verticalSpaceBetweenButtons
        self.view.addSubview(backspace)
        backspace.heightAnchor.constraint(equalToConstant: self.keyboard.buttonHeight).isActive = true
        // Backspace key is supposed to be square in portrait mode
        backspace.widthAnchor.constraint(equalToConstant: keyboard.buttonHeight).isActive = true
        backspace.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -keyboard.rightMargin).isActive = true
        backspace.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -bottomAnchorConstant).isActive = true
    }

    func makeNextKeyboardButton() {
        let nextKeyboard = NextKeyboardButton("🌐", proxyDelegate: self)
        let nextKeyboardMargin = 1.5*keyboard.buttonWidth + keyboard.horizontalSpaceBetweenButtons
        self.view.addSubview(nextKeyboard)
        nextKeyboard.heightAnchor.constraint(equalToConstant: self.keyboard.buttonHeight).isActive = true
        nextKeyboard.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: nextKeyboardMargin).isActive = true
        // Next keyboard key is supposed to be square in portrait mode
        nextKeyboard.widthAnchor.constraint(equalToConstant: keyboard.buttonHeight).isActive = true
        nextKeyboard.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -keyboard.bottomMargin).isActive = true
    }

    func makeSpaceButton() {
        let spacebar = SpaceButton(self.spaceButtonLabel, spaceText: self.spaceButtonText, proxyDelegate: self)
        let spacebarLeftMargin = 3.5*keyboard.buttonWidth + 3*keyboard.horizontalSpaceBetweenButtons + keyboard.leftMargin
        let spacebarRightMargin = 3*keyboard.buttonWidth + keyboard.horizontalSpaceBetweenButtons + keyboard.leftMargin
        self.view.addSubview(spacebar)
        spacebar.heightAnchor.constraint(equalToConstant: self.keyboard.buttonHeight).isActive = true
        spacebar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: spacebarLeftMargin).isActive = true
        spacebar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -spacebarRightMargin).isActive = true
        spacebar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -self.keyboard.bottomMargin).isActive = true
    }

    func makeReturnButton() {
        let returnKey = ReturnButton(self.returnButtonLabel, proxyDelegate: self)
        self.view.addSubview(returnKey)
        returnKey.heightAnchor.constraint(equalToConstant: self.keyboard.buttonHeight).isActive = true
        returnKey.widthAnchor.constraint(equalToConstant: 3*self.keyboard.buttonWidth).isActive = true
        returnKey.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -self.keyboard.rightMargin).isActive = true
        returnKey.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -self.keyboard.bottomMargin).isActive = true
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
