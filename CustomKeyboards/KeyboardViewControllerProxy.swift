//
//  KeyboardViewControllerProxy.swift
//  CustomKeyboards
//
//  Created by danielle kefford on 12/4/17.
//  Copyright © 2017 danielle kefford. All rights reserved.
//

/// This protocol declares the set of operations that need to be implemented
/// for modifying the underlying document for a specific UIViewController instance.
protocol KeyboardViewControllerProxy {
    mutating func insertText(buttonText: String)

    mutating func deleteText()

    mutating func advanceToNextKeyboard()
}
