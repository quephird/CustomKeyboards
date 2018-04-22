//
//  ChineseKeyboardViewController.swift
//  Emoji letters
//
//  Created by danielle kefford on 3/20/18.
//  Copyright © 2018 danielle kefford. All rights reserved.
//

import UIKit

/// Specialized view controller class for the emoji letter keyboard
class ChineseKeyboardViewController: KeyboardViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // This is a hack since I can't find enough lowercase versions of emoji letters
        self.letterButtonKeyRows = [
            [("贝","贝"), ("山","山"), ("モ","モ"), ("尺","尺"), ("丅","丅"), ("丫","丫"), ("凵","凵"), ("工","工"), ("口","口"), ("ㄗ","ㄗ")],
            [("丹","丹"), ("ち","ち"), ("刀","刀"), ("下","下"), ("ム","ム"), ("卄","卄"), ("丆","丆"), ("卡","卡"), ("乚","乚")],
            [("乙","乙"), ("メ","メ"), ("匚","匚"), ("丷","丷"), ("乃","乃"), ("れ","れ"), ("爪","爪")]
        ]

        self.deleteButtonLabel = "巜"
        self.returnButtonLabel = "尺モ丅凵尺れ"
        self.shiftButtonLabel = "介"
        self.spaceButtonText = "　"
        self.spaceButtonLabel = "ちㄗ丹匚モ"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

