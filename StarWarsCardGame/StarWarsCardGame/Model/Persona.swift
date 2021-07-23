//
//  Persona.swift
//  StarWarsCardGame
//
//  Created by lijia xu on 7/22/21.
//

import UIKit

class Persona {
    
    let name: String
    let photo: UIImage?
    let faction: String
    
    internal init(name: String, photo: UIImage?, faction: String) {
        self.name = name
        self.photo = photo
        self.faction = faction
    }
    
}

extension Persona: Equatable {
    static func == (lhs: Persona, rhs: Persona) -> Bool {
        return lhs.name == rhs.name && rhs.faction == rhs.faction
    }
    
}

