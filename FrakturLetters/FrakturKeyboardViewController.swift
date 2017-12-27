//
//  FrakturKeyboardViewController.swift
//  FrakturLetters
//
//  Created by danielle kefford on 12/25/17.
//  Copyright © 2017 danielle kefford. All rights reserved.
//

import UIKit

/// Specialized view controller class for the fraktur letters keyboard
class FrakturKeyboardViewController: KeyboardViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.letterButtonKeyRows = [
            [("𝖖","𝕼"), ("𝖜","𝖂"), ("𝖊","𝕰"), ("𝖗","𝕽"), ("𝖙","𝕿"), ("𝖞","𝖄"), ("𝖚","𝖀"), ("𝖎","𝕴"), ("𝖔","𝕺"), ("𝖕","𝕻")],
            [("𝖆","𝕬"), ("𝖘","𝕾"), ("𝖉","𝕯"), ("𝖋","𝕱"), ("𝖌","𝕲"), ("𝖍","𝕳"), ("𝖏","𝕵"), ("𝖐","𝕶"), ("𝖑","𝕷")],
            [("𝖟","𝖅"), ("𝖝","𝖃"), ("𝖈","𝕮"), ("𝖛","𝖁"), ("𝖇","𝕭"), ("𝖓","𝕹"), ("𝖒","𝕸")]
        ]
        self.deleteButtonLabel = "⬻"
        self.returnButtonLabel = "𝖗𝖊𝖙𝖚𝖗𝖓"
        self.spaceButtonLabel = " "
        self.shiftButtonLabel = "⇞"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
