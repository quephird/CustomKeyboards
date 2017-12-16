//
//  EmojiKeyboardViewController.swift
//  Emoji letters
//
//  Created by danielle kefford on 11/13/17.
//  Copyright © 2017 danielle kefford. All rights reserved.
//

import UIKit

class EmojiKeyboardViewController: KeyboardViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.letterButtonKeyRows = [
            ["🍳", "〰️", "📧", "®️", "✝️", "🈂️", "⛎", "ℹ️", "🅾️", "🅿️"],
            ["🅰️", "⚡️", "🆔", "🎏", "🌀", "♓️", "🗾", "🎋", "👢"],
            ["💤", "❌", "☪️", "♈️", "🅱️", "♑️", "♏️"]
        ]
        self.deleteButtonLabel = "🔙"
        self.spaceButtonLabel = "　"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

