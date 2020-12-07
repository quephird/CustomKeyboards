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

    var buttonLabel : UILabel
    // TODO: Rename these two fields to better distinguish them
    var delegate: Tappable!
    var proxyDelegate : KeyboardViewControllerProxy

    // Needed to keep XCode happy
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(_ labelText: String, proxyDelegate: KeyboardViewControllerProxy) {
        self.buttonLabel = UILabel()
        self.proxyDelegate = proxyDelegate
        super.init(frame: CGRect.zero)

        self.buttonLabel.translatesAutoresizingMaskIntoConstraints = false
        self.buttonLabel.text = labelText
        self.buttonLabel.font = self.buttonLabel.font.withSize(14)
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        self.addSubview(self.buttonLabel)
        self.buttonLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.buttonLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.backgroundColor = UIColor.init(white: 1, alpha: 1)
        self.translatesAutoresizingMaskIntoConstraints = true
        self.layer.cornerRadius = 4.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)

        self.isUserInteractionEnabled = true
        // We use the long press recognizer because it is supposedly more responsive
        let tap = UILongPressGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.minimumPressDuration = 0
        self.addGestureRecognizer(tap)
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
