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
    var spaceButtonLabel : String!
    var shiftButtonLabel : String!
    var keyboard : Keyboard!
    var letterButtons : [LetterButton]!

    func makeButtonRow(_ buttonKeys: [(String, String)]) -> [LetterButton] {
        let newButtons = buttonKeys.map { LetterButton($0, proxyDelegate: self) }
        let additionalMargin = (self.keyboard.keyboardWidth - self.keyboard.leftMargin - self.keyboard.rightMargin)*(10.0-CGFloat(newButtons.count))/20.0
        
        for (index, button) in newButtons.enumerated() {
            self.view.addSubview(button)
            
            button.heightAnchor.constraint(equalToConstant: self.keyboard.buttonHeight).isActive = true
            if index == 0 {
                button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: keyboard.leftMargin+additionalMargin).isActive = true
            } else if index < newButtons.count-1 {
                button.leadingAnchor.constraint(equalTo: newButtons[index-1].trailingAnchor, constant: self.keyboard.horizontalSpaceBetweenButtons).isActive = true
                button.widthAnchor.constraint(equalTo: newButtons[index-1].widthAnchor).isActive = true
                button.topAnchor.constraint(equalTo: newButtons[index-1].topAnchor).isActive = true
            } else {
                button.leadingAnchor.constraint(equalTo: newButtons[index-1].trailingAnchor, constant: self.keyboard.horizontalSpaceBetweenButtons).isActive = true
                button.widthAnchor.constraint(equalTo: newButtons[index-1].widthAnchor).isActive = true
                button.topAnchor.constraint(equalTo: newButtons[index-1].topAnchor).isActive = true
                button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -self.keyboard.rightMargin-additionalMargin).isActive = true
            }
        }
        
        return newButtons
    }

    func makeLetterButtons() {
        let letterButtonRows = letterButtonKeyRows.map { makeButtonRow($0) }
        self.letterButtons = Array(letterButtonRows.joined())

        for (index, buttonRow) in letterButtonRows.enumerated() {
            if index == 0 {
                buttonRow[0].topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.keyboard.topMargin).isActive = true
            } else {
                buttonRow[0].topAnchor.constraint(equalTo: letterButtonRows[index-1][0].bottomAnchor, constant: self.keyboard.verticalSpaceBetweenButtons).isActive = true
            }
        }
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

    func makeSpaceButton() {
        let spacebar = SpaceButton(self.spaceButtonLabel, proxyDelegate: self)
        let spacebarLeftMargin = 4*keyboard.buttonWidth + 2*keyboard.horizontalSpaceBetweenButtons
        let spacebarRightMargin = 3*keyboard.buttonWidth + keyboard.horizontalSpaceBetweenButtons
        self.view.addSubview(spacebar)
        spacebar.heightAnchor.constraint(equalToConstant: self.keyboard.buttonHeight).isActive = true
        spacebar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: spacebarLeftMargin).isActive = true
        spacebar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -spacebarRightMargin).isActive = true
        spacebar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -self.keyboard.bottomMargin).isActive = true
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

    func makeShiftButton() {
        let shiftKey = ShiftButton(self.shiftButtonLabel, proxyDelegate: self)
        let bottomAnchorConstant = keyboard.buttonHeight + 2*keyboard.verticalSpaceBetweenButtons
        self.view.addSubview(shiftKey)
        shiftKey.heightAnchor.constraint(equalToConstant: self.keyboard.buttonHeight).isActive = true
        // Backspace key is supposed to be square in portrait mode
        shiftKey.widthAnchor.constraint(equalToConstant: keyboard.buttonHeight).isActive = true
        shiftKey.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: keyboard.leftMargin).isActive = true
        shiftKey.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -bottomAnchorConstant).isActive = true
    }

    func makeKeyboard() {
        self.keyboard = Keyboard(UIScreen.main.bounds.width)

        self.makeLetterButtons()
        self.makeBackspaceButton()
        self.makeNextKeyboardButton()
        self.makeSpaceButton()
        self.makeShiftButton()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeKeyboard()
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
