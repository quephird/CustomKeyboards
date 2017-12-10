//
//  DoubledKeyboardViewController.swift
//  DoubledLetters
//
//  Created by danielle kefford on 12/9/17.
//  Copyright © 2017 danielle kefford. All rights reserved.
//

import UIKit

class DoubledKeyboardViewController : KeyboardViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.letterButtonKeyRows = [
            ["ℚ", "𝕎", "𝔼", "ℝ", "𝕋", "𝕐", "𝕌", "𝕀", "𝕆", "ℙ"],
            ["𝔸", "𝕊", "𝔻", "𝔽", "𝔾", "ℍ", "𝕁", "𝕂", "𝕃"],
            ["ℤ", "𝕏", "ℂ", "𝕍", "𝔹", "ℕ", "𝕄"]
        ]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

