//
//  DoubledKeyboardViewController.swift
//  DoubledLetters
//
//  Created by danielle kefford on 12/9/17.
//  Copyright © 2017 danielle kefford. All rights reserved.
//

import UIKit

/// Specialized view controller class for the doubled letters keyboard
class DoubledKeyboardViewController : KeyboardViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.letterButtonKeyRows = [
            [("𝕢","ℚ"), ("𝕨","𝕎"), ("𝕖","𝔼"), ("𝕣","ℝ"), ("𝕥","𝕋"), ("𝕪","𝕐"), ("𝕦","𝕌"), ("𝕚","𝕀"), ("𝕠","𝕆"), ("𝕡","ℙ")],
            [("𝕒","𝔸"), ("𝕤","𝕊"), ("𝕕","𝔻"), ("𝕗","𝔽"), ("𝕘","𝔾"), ("𝕙","ℍ"), ("𝕛","𝕁"), ("𝕜","𝕂"), ("𝕝","𝕃")],
            [("𝕫","ℤ"), ("𝕩","𝕏"), ("𝕔","ℂ"), ("𝕧","𝕍"), ("𝕓","𝔹"), ("𝕟","ℕ"), ("𝕞","𝕄")]
        ]
        self.deleteButtonLabel = "⤆"
        self.returnButtonLabel = "𝕣𝕖𝕥𝕦𝕣𝕟"
        self.spaceButtonLabel = " "
        self.shiftButtonLabel = "⇑"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
