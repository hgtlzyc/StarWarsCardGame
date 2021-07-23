//
//  CardsCollectionViewController.swift
//  StarWarsCardGame
//
//  Created by lijia xu on 7/22/21.
//

import UIKit

private let reuseIdentifier = "Cell"

class CardsCollectionViewController: UICollectionViewController {
    
    var personaCards: [Persona] = []
    var factionIsJedi: Bool = true
    var targetPersona: Persona?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shuffleCards()
    }
    
    func shuffleCards() {
        
        personaCards = []
        
        var targetFaction: [Persona] = []
        var offTargetPersona: Persona?
        
        if factionIsJedi {
            targetFaction = Array(PersonaController.jedi.shuffled().prefix(3))
            offTargetPersona = PersonaController.sith.randomElement()
        } else {
            targetFaction = Array(PersonaController.sith.shuffled().prefix(3))
            offTargetPersona = PersonaController.jedi.randomElement()
        }
        
        personaCards.append(contentsOf: targetFaction)
        targetPersona = personaCards.randomElement()
        
        if let offTargetPersona = offTargetPersona {
            personaCards.append(offTargetPersona)
        }
        
        personaCards.shuffle()

        updateView()
    }
    
    func updateView() {
        title = targetPersona.map{ "Find \($0.name)" }
        collectionView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return personaCards.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "personaCell", for: indexPath) as? PersonalCollectionViewCell else { return UICollectionViewCell() }
    
        let persona = personaCards[indexPath.row]
        
        cell.displayImageFor(persona: persona)
        cell.personaImageView.isUserInteractionEnabled = false
        cell.isUserInteractionEnabled = true
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedPersona = personaCards[indexPath.row]
        
        let isCorrect = selectedPersona == targetPersona
        
        presentResultAlert(isCorrect)
    }
    
    

}//End Of VC


extension CardsCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width * 0.45
        
        return CGSize(width: width, height: width * (4/3))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let cellsTotalWidth = view.frame.width * 0.45 * 2
        
        let leftOverWideth = view.frame.width - cellsTotalWidth
        
        let inset = leftOverWideth / 3
        
        return UIEdgeInsets(top: inset, left: inset, bottom: 0, right: inset)
    }
    
    
}//End Of Extension


// MARK: - Alert
extension CardsCollectionViewController {
    func presentResultAlert(_ isCorrect: Bool){

        let title = isCorrect ? "Good Job" : "Boooo"
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        let doneAction = UIAlertAction(title: "Done", style: .default, handler: nil)
        
        let shuffleAction = UIAlertAction(title: "Shuffle", style: .default) { _ in
            self.shuffleCards()
        }
        
        if isCorrect {
            alert.addAction(shuffleAction)
        } else {
            alert.addAction(doneAction)
        }
        
        present(alert, animated: true)
        
    }
}
