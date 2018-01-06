//
//  TinyKeyboardViewController.swift
//  TinyLetters
//
//  Created by danielle kefford on 1/6/18.
//  Copyright © 2018 danielle kefford. All rights reserved.
//

import UIKit

/// Specialized view controller class for the tiny letter keyboard
class TinyKeyboardViewController: KeyboardViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // This is a hack since I can't find enough lowercase versions of emoji letters
        // q, yfzxc
        self.letterButtonKeyRows = [
            [("૧","૧"), ("ʷ","ᵂ"), ("ᵉ","ᴱ"), ("ʳ","ᴿ"), ("ᵗ","ᵀ"), ("ʸ","ʸ"), ("ᵘ","ᵁ"), ("ᶦ","ᴵ"), ("ᵒ","ᴼ"), ("ᵖ","ᴾ")],
            [("ᵃ","ᴬ"), ("ˢ","ˢ"), ("ᵈ","ᴰ"), ("ᶠ","ᶠ"), ("ᵍ","ᴳ"), ("ʰ","ᴴ"), ("ʲ","ᴶ"), ("ᵏ","ᴷ"), ("ᶫ","ᴸ")],
            [("ᶻ","ᶻ"), ("ˣ","ˣ"), ("ᶜ","ᶜ"), ("ᵛ","ⱽ"), ("ᵇ","ᴮ"), ("ᶰ","ᴺ"), ("ᵐ","ᴹ")]
        ]
        self.deleteButtonLabel = "˂"
        self.returnButtonLabel = "ʳᵉᵗᵘʳᶰ"
        self.shiftButtonLabel = "˄"
        self.spaceButtonText = " "
        self.spaceButtonLabel = "ˢᵖᵃᶜᵉ"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
