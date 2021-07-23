//
//  PersonalCollectionViewCell.swift
//  StarWarsCardGame
//
//  Created by lijia xu on 7/22/21.
//

import UIKit

class PersonalCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var personaImageView: UIImageView!
    
    func displayImageFor(persona: Persona) {
        personaImageView.image = persona.photo
        personaImageView.contentMode = .scaleAspectFill
    }
    
}
