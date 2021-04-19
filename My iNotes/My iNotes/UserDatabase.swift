//
//  UserDatabase.swift
//  My iNotes
//
//  Created by Diego Zamora on 19/04/21.
//

import Foundation


class UserDatabase {
    func getAllObjects() -> [Nota] {
        
        if let objects = UserDefaults.standard.value(forKey: "notas") as? Data
        {
            let decoder = JSONDecoder()
            
            if let objectsDecoded = try? decoder.decode(Array.self, from: objects) as [Nota]
            {
                return objectsDecoded.sorted(by: { (item1, item2) -> Bool in
                    return item1.fecha.compare(item2.fecha) == ComparisonResult.orderedDescending
                })
            }
            else
            {
                return []
            }
        }
        else
        {
            return []
        }
        
    }

    func saveAllObjects(allObjects: [Nota]) -> Bool {
        let encoder = JSONEncoder()
        
        if let encoded = try? encoder.encode(allObjects)
        {
            UserDefaults.standard.set(encoded, forKey: "notas")
            return true
        }
        else
        {
            return false
        }
    }
}
