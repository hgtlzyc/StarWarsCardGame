//
//  CharacterController.swift
//  CardGame
//
//  Created by RYAN GREENBURG on 12/14/20.
//

import UIKit

class PersonaController {
    static let jedi = [Persona(name: "Anakin Skywalker", photo: UIImage(named: "anakin"), faction: "Jedi"),
                         Persona(name: "Obi Wan Kenobi", photo: UIImage(named: "obi"), faction: "Jedi"),
                         Persona(name: "Ahsoka Tano", photo: UIImage(named: "ahsoka"), faction: "Jedi"),
                         Persona(name: "Princess Leia", photo: UIImage(named: "leia"), faction: "Jedi"),
                         Persona(name: "Luke Skywalker", photo: UIImage(named: "luke"), faction: "Jedi"),
                         Persona(name: "Mace Windu", photo: UIImage(named: "mace"), faction: "Jedi"),
                         Persona(name: "Rey", photo: UIImage(named: "rey"), faction: "Jedi"),
                         Persona(name: "Master Yoda", photo: UIImage(named: "yoda"), faction: "Jedi")]
    
    static let sith = [Persona(name: "Darth Maul", photo:                                     UIImage(named: "maul"), faction: "Sith"),
                       Persona(name: "Moff Gideon", photo: UIImage(named: "moff"), faction: "Sith"),
                       Persona(name: "Darth Vader", photo: UIImage(named: "vader"), faction: "Sith"),
                       Persona(name: "Kylo Ren", photo: UIImage(named: "ren"), faction: "Sith"),
                       Persona(name: "Darth Sidious", photo: UIImage(named: "sidious"), faction: "Sith")]
}

