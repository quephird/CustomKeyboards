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
    
    let verticalSpaceBetweenButtons = CGFloat(10.0)
    let verticalMargin = CGFloat(10.0)
    
    // TODO: Need to somehow trigger click sound when button touched
    // TODO: Need to somehow "grow" button when touched like the system ones do
    func makeButton(_ buttonText: String) -> UIView {
        let newButton = UIView()
        let newButtonLabel = UILabel()
        let buttonHeight = (CGFloat(226.0) - 2*self.verticalMargin - 3*self.verticalSpaceBetweenButtons)/4.0
        
        // TODO: Wire this up
        // newButton.addGestureRecognizer(UIGestureRecognizer.init(target: self, action: #selector(emojiButtonHandler)))
        newButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        newButtonLabel.text = buttonText
        
        newButton.addSubview(newButtonLabel)
        newButtonLabel.centerXAnchor.constraint(equalTo: newButton.centerXAnchor).isActive = true
        newButtonLabel.centerYAnchor.constraint(equalTo: newButton.centerYAnchor).isActive = true
        
        newButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        newButton.backgroundColor = UIColor.init(white: 1, alpha: 1)
        newButton.translatesAutoresizingMaskIntoConstraints = false
        newButton.layer.cornerRadius = 4.0
        newButton.layer.shadowColor = UIColor.black.cgColor
        newButton.layer.shadowOpacity = 1.0
        newButton.layer.shadowRadius = 0.0
        newButton.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        
        return newButton
    }
    
    func makeButtonRow(_ buttonKeys: [String]) -> [UIView] {
        let newButtons = buttonKeys.map { makeButton($0) }
        let spaceBetweenButtons = CGFloat(7.0)
        let leftMargin = CGFloat(5.0)
        let rightMargin = CGFloat(5.0)
        let keyboardWidth = CGFloat(320.0)
        let additionalMargin = (keyboardWidth - leftMargin - rightMargin)*(10.0-CGFloat(newButtons.count))/20.0
        
        for (index, button) in newButtons.enumerated() {
            self.view.addSubview(button)
            
            if index == 0 {
                button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: leftMargin+additionalMargin).isActive = true
            } else if index < newButtons.count-1 {
                button.leadingAnchor.constraint(equalTo: newButtons[index-1].trailingAnchor, constant: spaceBetweenButtons).isActive = true
                button.widthAnchor.constraint(equalTo: newButtons[index-1].widthAnchor).isActive = true
                button.topAnchor.constraint(equalTo: newButtons[index-1].topAnchor).isActive = true
            } else {
                button.leadingAnchor.constraint(equalTo: newButtons[index-1].trailingAnchor, constant: spaceBetweenButtons).isActive = true
                button.widthAnchor.constraint(equalTo: newButtons[index-1].widthAnchor).isActive = true
                button.topAnchor.constraint(equalTo: newButtons[index-1].topAnchor).isActive = true
                button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -rightMargin-additionalMargin).isActive = true
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
        let letterButtonKeyRows = [
            ["🍳", "〰️", "📧", "®️", "✝️", "🈂️", "⛎", "ℹ️", "🅾️", "🅿️"],
            ["🅰️", "⚡️", "🆔", "🎏", "🌀", "♓️", "🗾", "🎋", "👢"],
            ["💤", "❌", "☪️", "♈️", "🅱️", "♑️", "♏️"]
        ]
        let letterButtonRows = letterButtonKeyRows.map { makeButtonRow($0) }
        
        for (index, buttonRow) in letterButtonRows.enumerated() {
            
            if index == 0 {
                buttonRow[0].topAnchor.constraint(equalTo: self.view.topAnchor, constant: verticalMargin).isActive = true
            } else {
                buttonRow[0].topAnchor.constraint(equalTo: letterButtonRows[index-1][0].bottomAnchor, constant: verticalSpaceBetweenButtons).isActive = true
            }
        }
        
        let spacebar = makeButton(" ")
        self.view.addSubview(spacebar)
        spacebar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 120.0).isActive = true
        spacebar.topAnchor.constraint(equalTo: letterButtonRows[2][0].bottomAnchor, constant: verticalSpaceBetweenButtons).isActive = true
        spacebar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -120.0).isActive = true
        spacebar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -verticalMargin).isActive = true
        
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
    
    func emojiButtonHandler(recognizer: UIGestureRecognizer) {
        // TODO
    }
    
    // TODO: Replace button handler logic here with distinct and separate handlers
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // call the superclass' function because you almost always should
        super.touchesBegan(touches, with: event)
        
        // get the user's touch
        let touch = touches.first
        
        // get the coordinates (point) of the touch
        let touchPoint = touch?.location(in: self.view)
        
        // get the view (key) the touch is in
        let touchView = self.view.hitTest(touchPoint!, with: nil)
        
        // get the key's label
        let touchViewLabel = touchView?.subviews[0]
        
        // downcast the label from UIView to UILabel so we can access the "text" property
        let touchViewLabelRaw = touchViewLabel as! UILabel
        
        // insert the label's text into the text field
        textDocumentProxy.insertText(touchViewLabelRaw.text!)
    }
}

