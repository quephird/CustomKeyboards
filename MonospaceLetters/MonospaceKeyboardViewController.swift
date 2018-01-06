//
//  MonospaceKeyboardViewController.swift
//  MonospaceLetters
//
//  Created by danielle kefford on 1/3/18.
//  Copyright © 2018 danielle kefford. All rights reserved.
//

import UIKit

/// Specialized view controller class for the monospace letter keyboard
class MonospaceKeyboardViewController: KeyboardViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // This is a hack since I can't find enough lowercase versions of emoji letters
        self.letterButtonKeyRows = [
            [("𝚚","𝚀"), ("𝚠","𝚆"), ("𝚎","𝙴"), ("𝚛","𝚁"), ("𝚝","𝚃"), ("𝚢","𝚈"), ("𝚞","𝚄"), ("𝚒","𝙸"), ("𝚘","𝙾"), ("𝚙","𝙿")],
            [("𝚊","𝙰"), ("𝚜","𝚂"), ("𝚍","𝙳"), ("𝚏","𝙵"), ("𝚐","𝙶"), ("𝚑","𝙷"), ("𝚓","𝙹"), ("𝚔","𝙺"), ("𝚕","𝙻")],
            [("𝚣","𝚉"), ("𝚡","𝚇"), ("𝚌","𝙲"), ("𝚟","𝚅"), ("𝚋","𝙱"), ("𝚗","𝙽"), ("𝚖","𝙼")]
        ]
        self.deleteButtonLabel = "<"
        self.returnButtonLabel = "𝚛𝚎𝚝𝚞𝚛𝚗"
        self.shiftButtonLabel = "^"
        self.spaceButtonText = " "
        self.spaceButtonLabel = "𝚜𝚙𝚊𝚌𝚎"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

