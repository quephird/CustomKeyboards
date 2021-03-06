//
//  DotMatrixKeyboardViewController.swift
//  Emoji letters
//
//  Created by danielle kefford on 11/13/17.
//  Copyright © 2017 danielle kefford. All rights reserved.
//

import UIKit

/// Specialized view controller class for the dot matrix letter keyboard
class DotMatrixKeyboardViewController : KeyboardViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.letterButtonKeyRows = [
            [("⠪⡇","⢎⣱"), ("⢶⣶","⣧⣼"), ("⢴⣦","⣟⣋"), ("⡖","⡯⢕"), ("⢗","⠉⡏"), ("⢘⡺","⠑⡎"), ("⢆⣰","⣇⣸"), ("⢨","⢸"), ("⢔⡢","⢎⡱"), ("⢸⠕","⡯⠕")],
            [("⢔⣲","⡮⢵"), ("⣴⡶","⣚⡫"), ("⢔⣺","⣏⡱"), ("⡮","⡟⠋"), ("⢪⡽","⢎⡭"), ("⡗⢢","⡗⢺"), ("⠠⡨","⢄⡸"), ("⢸⢔","⡗⢎"), ("⢹","⣇⣀")],
            [("⣲⡂","⣩⣋"), ("⡢⢔","⡱⢎"), ("⢔⡂","⢎⣉"), ("⢆⡰","⢣⡜"), ("⣗⡢","⣟⡳"), ("⡖⢢","⡗⢼"), ("⣶⣦","⡟⢻")]
        ]

        self.deleteButtonLabel = "⢾⠶"
        self.returnButtonLabel = "⡖⢴⣦⢗⢆⣰⡖⡖⢢"
        self.spaceButtonText = "　"
        self.spaceButtonLabel = "⣴⡶⢸⠕⢔⣲⢔⡂⢴⣦"
        self.shiftButtonLabel = "⢺⡗"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
