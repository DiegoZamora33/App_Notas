//
//  DataBase.swift
//  My iNotes
//
//  Created by Diego Zamora on 19/04/21.
//

import Foundation

//set, get & remove User own profile in cache
struct myData {
    static let key = "notas"
    
    static func save(_ value: Notas!) {
         UserDefaults.standard.set(try? PropertyListEncoder().encode(value), forKey: key)
    }
    
    static func get() -> Notas! {
        var userData: Notas!
        if let data = UserDefaults.standard.value(forKey: key) as? Data {
            userData = try? PropertyListDecoder().decode(Notas.self, from: data)
            return userData!
        } else {
            return userData
        }
    }
    
    static func remove() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
