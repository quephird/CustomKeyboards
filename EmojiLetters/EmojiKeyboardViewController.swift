//
//  EmojiKeyboardViewController.swift
//  Emoji letters
//
//  Created by danielle kefford on 11/13/17.
//  Copyright © 2017 danielle kefford. All rights reserved.
//

import UIKit

/// Specialized view controller class for the emoji letter keyboard
class EmojiKeyboardViewController: KeyboardViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // This is a hack since I can't find enough lowercase versions of emoji letters
        self.letterButtonKeyRows = [
            [("🍳","🍳"), ("〰️","〰️"), ("📧","📧"), ("®️","®️"), ("✝️","✝️"), ("🈂️","🈂️"), ("⛎","⛎"), ("ℹ️","ℹ️"), ("🅾️","🅾️"), ("🅿️","🅿️")],
            [("🅰️","🅰️"), ("⚡️","⚡️"), ("🆔","🆔"), ("🎏","🎏"), ("🌀","🌀"), ("♓️","♓️"), ("🗾","🗾"), ("🎋","🎋"), ("👢","👢")],
            [("💤","💤"), ("❌","❌"), ("☪️","☪️"), ("♈️","♈️"), ("🅱️","🅱️"), ("♑️","♑️"), ("♏️","♏️")]
        ]
        self.deleteButtonLabel = "🔙"
        self.returnButtonLabel = "↩️"
        self.shiftButtonLabel = ""
        self.spaceButtonLabel = "　"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
