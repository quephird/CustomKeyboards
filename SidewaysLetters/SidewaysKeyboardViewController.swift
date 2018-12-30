//
//  SidewaysLetters
//  SidewaysKeyboardViewController.swift
//
//  Created by danielle kefford on 12/29/18.
//  Copyright © 2018 danielle kefford. All rights reserved.
//

import UIKit

class SidewaysKeyboardViewController: KeyboardViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.letterButtonKeyRows = [
            [("℺","℺"), ("ᕒ","ᕒ"), ("ш","ш"), ("ᘇ","ᘇ"), ("⊢","⊢"), ("᚛","᚛"), ("ᑐ","ᑐ"), ("—","—"), ("⬭","⬭"), ("ᓇ","ᓇ")],
            [("ᗉ","ᗉ"), ("ഗ","ഗ"), ("ᗝ","ᗝ"), ("꜡","꜡"), ("ᘎ","ᘎ"), ("エ","エ"), ("ᓓ","ᓓ"), ("⊻","⊻"), ("ᒧ","ᒧ")],
            [("N","N"), ("✕","✕"), ("ᑌ","ᑌ"), (">",">"), ("ᗶ","ᗶ"), ("Z","Z"), ("ᓬ","ᓬ")]
        ]
        self.deleteButtonLabel = "⬇︎"
        self.returnButtonLabel = "↷"
        self.shiftButtonLabel = ""
        self.spaceButtonText = " "
        self.spaceButtonLabel = " "
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
