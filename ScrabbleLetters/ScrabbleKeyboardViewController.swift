//
//  ScrabbleKeyboardViewControllerr.swift
//  ScrabbleLetters
//
//  Created by danielle kefford on 12/25/17.
//  Copyright © 2017 danielle kefford. All rights reserved.
//

import UIKit

/// Specialized view controller class for the emoji letter keyboard
class ScrabbleKeyboardViewController: KeyboardViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // This is a hack since I can't find enough lowercase versions of emoji letters
        self.letterButtonKeyRows = [
            [("🅀₁₀","🅀₁₀"), ("🅆₄","🅆₄"), ("🄴₁","🄴₁"), ("🅁₁","🅁₁"), ("🅃₁","🅃₁"), ("🅈₄","🅈₄"), ("🅄₁","🅄₁"), ("🄸₁","🄸₁"), ("🄾₁","🄾₁"), ("🄿₃","🄿₃")],
            [("🄰₁","🄰₁"), ("🅂₁","🅂₁"), ("🄳₂","🄳₂"), ("🄵₄","🄵₄"), ("🄶₂","🄶₂"), ("🄷₄","🄷₄"), ("🄹₈","🄹₈"), ("🄺₅","🄺₅"), ("🄻₁","🄻₁")],
            [("🅉₁₀","🅉₁₀"), ("🅇₈","🅇₈"), ("🄲₃","🄲₃"), ("🅅₄","🅅₄"), ("🄱₃","🄱₃"), ("🄽₁","🄽₁"), ("🄼₃","🄼₃")]
        ]
        self.deleteButtonLabel = "←⃞"
        self.spaceButtonLabel = ""
        self.shiftButtonLabel = ""
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
