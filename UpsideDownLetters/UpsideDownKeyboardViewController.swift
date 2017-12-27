//
//  UpsideDownKeyboardViewController.swift
//  UpsideDownLetters
//
//  Created by danielle kefford on 12/26/17.
//  Copyright © 2017 danielle kefford. All rights reserved.
//

import UIKit

/// Specialized view controller class for the doubled letters keyboard
class UpsideDownKeyboardViewController : KeyboardViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.letterButtonKeyRows = [
            [("b","Ò"), ("ʍ","M"), ("ǝ","Ǝ"), ("ɹ","ᖈ"), ("ʇ","⟂"), ("ʎ","⅄"), ("n","Ⴖ"), ("ᴉ","I"), ("o","O"), ("d","Ԁ")],
            [("ɐ","ᗄ"), ("s","S"), ("p","ᗡ"), ("ɟ","Ⅎ"), ("ƃ","⅁"), ("ɥ","H"), ("ɾ","ᒋ"), ("ʞ","ʞ"), ("l","ᒣ")],
            [("z","Z"), ("x","X"), ("ɔ","Ɔ"), ("ʌ","Λ"), ("q","ᗺ"), ("u","N"), ("ɯ","W")]
        ]
        self.deleteButtonLabel = "⌦"
        self.returnButtonLabel = "uɹnʇǝɹ"
        self.spaceButtonLabel = " "
        self.shiftButtonLabel = "⇩"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
