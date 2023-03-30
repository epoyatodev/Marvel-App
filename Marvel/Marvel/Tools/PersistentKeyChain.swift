//
//  PersistentKeyChain.swift
//  Marvel
//
//  Created by Enrique Poyato Ortiz on 27/3/23.
//
// Por ahora no usaré keychain
//

import Foundation

@propertyWrapper
class KCPersistentKeyChain {
    private var key: String

    
    init(key: String) {
        self.key = key
    }
    
    var wrappedValue: String {
        get{
            if let value = loadKeyChain(key: key) {
                return value
            } else {
                return ""
            }
        }
        set{
            saveKeyChain(key: key, value: newValue) // al asignar grabamos en el keychain
        }
    }
}
