//
//  DetailViewController.swift
//  RxSwiftAndMova
//
//  Created by Alessandro Pace on 29/6/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK:: - OUTLETS -
    
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterGenderLabel: UILabel!
    @IBOutlet weak var characterWeightLabel: UILabel!
    @IBOutlet weak var characterHeightLabel: UILabel!
    @IBOutlet weak var characterHairLabel: UILabel!
    @IBOutlet weak var characterSkinLabel: UILabel!
    @IBOutlet weak var characterEyeLabel: UILabel!
    @IBOutlet weak var characterBirthdateLabel: UILabel!
    @IBOutlet weak var characterCountFilmsInLabel: UILabel!
    
    //MARK:: - VARS -
    
    var character: Character?
    
    //MARK:: - OVERRIDE METHODS -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setScreen()
    }

    //MARK:: - METHODS -

    private func setScreen() {
        guard let _character = character else {
            return
        }
        
        characterNameLabel.text = _character.name
        characterGenderLabel.text = _character.gender
        characterWeightLabel.text = _character.mass
        characterHeightLabel.text = _character.height
        characterHairLabel.text = _character.hair_color
        characterSkinLabel.text = _character.skin_color
        characterEyeLabel.text = _character.eye_color
        characterBirthdateLabel.text = _character.birth_year
        characterCountFilmsInLabel.text = "\(_character.films?.count ?? 0)"
        
    }
}

