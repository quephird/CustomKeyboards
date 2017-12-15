//
//  DocumentProxyDelegate.swift
//  CustomKeyboards
//
//  Created by danielle kefford on 12/4/17.
//  Copyright © 2017 danielle kefford. All rights reserved.
//

protocol DocumentProxyDelegate {
    mutating func insertText(buttonText: String)

    mutating func deleteText()
}
