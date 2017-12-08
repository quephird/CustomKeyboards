//
//  KeyboardButton.swift
//  CustomKeyboards
//
//  Created by danielle kefford on 11/27/17.
//  Copyright © 2017 danielle kefford. All rights reserved.
//

import UIKit

// TODO: Need to somehow "grow" button when touched like the system ones do
class KeyboardButton : UIView {
    var labelText : String
    var documentProxyDelegate : DocumentProxyDelegate

    // Needed to keep XCode happy
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(_ labelText: String, height: CGFloat, documentProxyDelegate: DocumentProxyDelegate) {
        self.labelText = labelText
        self.documentProxyDelegate = documentProxyDelegate
        super.init(frame: CGRect.zero)

        let newButtonLabel = UILabel()
        newButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        newButtonLabel.text = labelText
        self.addSubview(newButtonLabel)
        newButtonLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        newButtonLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        self.backgroundColor = UIColor.init(white: 1, alpha: 1)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 4.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)

        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(UIGestureRecognizer.init(target: self, action: #selector(handleTap(_:))))
    }
    
    @objc func handleTap(_ recognizer: UIGestureRecognizer) {
        print("I am here!!!")
    }
}

extension KeyboardButton : UIInputViewAudioFeedback {
    public var enableInputClicksWhenVisible: Bool {
        return true
    }
}
