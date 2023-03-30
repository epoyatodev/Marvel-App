//
//  KeyChain.swift
//  Marvel
//
//  Created by Enrique Poyato Ortiz on 27/3/23.
//
// Por ahora no usaré keychain
//

import Foundation
import KeychainSwift

@discardableResult func saveKeyChain(key: String, value: String) -> Bool{
    if let data = value.data(using: .utf8){
        let keychain = KeychainSwift()
        keychain.set(data, forKey: key)
        return true
    }else {
        return false
    }
    
}

func loadKeyChain(key: String) -> String? {
    let keychain = KeychainSwift()
    
    if let data = keychain.get(key){
        return data
    }else {
        return ""
    }
}


func deleteKeyChain(key: String){
    let keychain = KeychainSwift()
    keychain.delete(key)

}
