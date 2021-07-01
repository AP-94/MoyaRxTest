//
//  CharacterCell.swift
//  RxSwiftAndMova
//
//  Created by Alessandro Pace on 29/6/21.
//

import UIKit

class CharacterCell: UITableViewCell {
    
    static var cellIdentifier = "characterCell"
    
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterGenderLabel: UILabel!
    
    var characterItem: Character? {
        didSet {
            fillCell()
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        //clean view
    }

    private func fillCell() {
        guard let character = characterItem else {
            return
        }
        
        characterNameLabel.text = character.name
        characterGenderLabel.text = character.gender
    }
    
}
