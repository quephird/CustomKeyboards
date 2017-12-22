//
//  KeyboardButton.swift
//  CustomKeyboards
//
//  Created by danielle kefford on 11/27/17.
//  Copyright © 2017 danielle kefford. All rights reserved.
//

import UIKit
import AudioToolbox

/// This is an abstract class of sorts, representing a base implementation for
/// all button types for letters, the space bar, backspace, etc.
class KeyboardButton : UIView {
    let clickSoundId = UInt32(1123)
    let deleteSoundId = UInt32(1155)
    let modifierSoundId = UInt32(1156)

    var labelText : String
    var delegate: Tappable!
    var proxyDelegate : KeyboardViewControllerProxy

    // Needed to keep XCode happy
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(_ labelText: String, proxyDelegate: KeyboardViewControllerProxy) {
        self.labelText = labelText
        self.proxyDelegate = proxyDelegate
        super.init(frame: CGRect.zero)

        let newButtonLabel = UILabel()
        newButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        newButtonLabel.text = labelText
        self.addSubview(newButtonLabel)
        newButtonLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        newButtonLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.backgroundColor = UIColor.init(white: 1, alpha: 1)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 4.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)

        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
    }

    @objc func handleTap(_ recognizer: UITapGestureRecognizer) {
        delegate.handleTap(recognizer)
    }
    
//    I have to resort to the following hack instead of using
//    UIDevice.current.playInputClick because the documentation lies
//    and this is how I feel about the software industry:
//
//    (╯°□°）╯︵
//    ┳┳┳┳┳　　|
//    ┏┓┏┓┃　　|
//    ┗┛┗┛┃
//    ┏┓┏┓┃ǝɹɐʍʇɟos ll∀
//    ┗┛┗┛┃
//    ┏┓┏┓┃
//    ┗┛┗┛┃
//    ┏┓┏┓┃🔥🔥🔥🔥
//    ┗┛┗┛┃🔥🔥🔥🔥
//    ┏┓┏┓┃🔥🔥🔥🔥
//    ┃┃┃┃┃🔥🔥🔥🔥
//    ┻┻┻┻┻
    
    func playInputClick(soundId: UInt32) {
        DispatchQueue.global(qos: .default).async(execute: {
            AudioServicesPlaySystemSound(soundId)
        })
    }
}
