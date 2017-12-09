//
//  KeyboardViewController.swift
//  Emoji letters
//
//  Created by danielle kefford on 11/13/17.
//  Copyright © 2017 danielle kefford. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    var nextKeyboardButton: UIButton!
    var keyboard : Keyboard!

    let letterButtonKeyRows = [
        ["🍳", "〰️", "📧", "®️", "✝️", "🈂️", "⛎", "ℹ️", "🅾️", "🅿️"],
        ["🅰️", "⚡️", "🆔", "🎏", "🌀", "♓️", "🗾", "🎋", "👢"],
        ["💤", "❌", "☪️", "♈️", "🅱️", "♑️", "♏️"]
    ]

    func makeButtonRow(_ buttonKeys: [String]) -> [UIView] {
        let newButtons = buttonKeys.map { KeyboardButton($0, height: self.keyboard.buttonHeight, documentProxyDelegate: self) }
        let additionalMargin = (keyboard.keyboardWidth - self.keyboard.leftMargin - self.keyboard.rightMargin)*(10.0-CGFloat(newButtons.count))/20.0
        
        for (index, button) in newButtons.enumerated() {
            self.view.addSubview(button)
            
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
    
    // TODO: Make this a UIView and incorporate into fourth row of buttons
    func makeNextKeyboardButton() {
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("🌐", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    func makeKeyboard() {
        self.keyboard = Keyboard(self.letterButtonKeyRows)

        let letterButtonRows = letterButtonKeyRows.map { makeButtonRow($0) }
        
        for (index, buttonRow) in letterButtonRows.enumerated() {
            if index == 0 {
                buttonRow[0].topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.keyboard.topMargin).isActive = true
            } else {
                buttonRow[0].topAnchor.constraint(equalTo: letterButtonRows[index-1][0].bottomAnchor, constant: self.keyboard.verticalSpaceBetweenButtons).isActive = true
            }
        }
        
        let spacebar = KeyboardButton("　", height: self.keyboard.buttonHeight, documentProxyDelegate: self)
        self.view.addSubview(spacebar)
        // TODO: Define the magic number 120.0 somewhere
        spacebar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 120.0).isActive = true
        // TODO: This is super hacky
        spacebar.topAnchor.constraint(equalTo: letterButtonRows[2][0].bottomAnchor, constant: self.keyboard.verticalSpaceBetweenButtons).isActive = true
        // TODO: Define the magic number -120.0 somewhere
        spacebar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -120.0).isActive = true
        spacebar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -self.keyboard.bottomMargin).isActive = true
        
        self.makeNextKeyboardButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.makeKeyboard()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }
}

extension KeyboardViewController : DocumentProxyDelegate {
    func updateText(buttonText: String) {
        self.textDocumentProxy.insertText(buttonText)
    }
}
