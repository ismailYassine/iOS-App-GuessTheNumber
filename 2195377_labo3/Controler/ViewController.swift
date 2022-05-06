//
//  ViewController.swift
//  2195377_labo3
//
//  Created by Ismail on 2022-04-01.


import UIKit

class ViewController: UIViewController{
    

    var game: Game = Game()
    
    //Label min & max
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var tentative: UILabel!
    
    // StackViews Outlets
    @IBOutlet weak var sViewGameInfos: UIStackView!
    @IBOutlet weak var sViewInfo1: UIStackView!
    @IBOutlet weak var sViewInfo2: UIStackView!
    @IBOutlet weak var gameInfosSV: UIStackView!
    
    // Button contextual menu
    @IBOutlet weak var btnContextualMenu: UIButton!
    
    // Slider
    @IBOutlet weak var sliderOTL: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBOutlet weak var minSlider: UILabel!
    @IBOutlet weak var maxSlider: UILabel!
    
    @IBAction func sliderOnChange(_ sender: Any) {
        sliderLabel.text = "\(Int(sliderOTL.value))"
    }
    
    // Button for checking
    @IBOutlet weak var checkButton: UIButton!
    @IBAction func checkButtonAction() {
        tentative.text = "\(game.nbrOfAttempt)/\(game.maxAttempt)"
       
            let chiffreMystere = game.nbrToGuess
            let slideVal = Int(sliderOTL.value)
            
            if slideVal == chiffreMystere {
                checkButton.isEnabled = false
                msgLabel.text = game.playerWonMessage + "\(game.nbrToGuess)."
                game.nbrOfAttempt = 0
                
                tentative.text = String(0)
                minLabel.text = String(0)
                maxLabel.text = String(0)

            }else if game.nbrOfAttempt == game.maxAttempt {
                checkButton.isEnabled = false
                game.nbrOfAttempt = 0
                msgLabel.text = game.playerLostMessage + "\(game.nbrToGuess)."
                self.btnContextualMenu.setTitle("Play", for: .normal)
                
                sliderOTL.value = 0
                sliderLabel.text = String(0)
                self.minSlider.text = String(0)
                self.maxSlider.text = String(0)
                sliderOTL.isEnabled = false

                tentative.text = String(0)
                minLabel.text = String(0)
                maxLabel.text = String(0)
            } else {
                
                if slideVal < chiffreMystere {
                    msgLabel.text = game.nbrGuessedSmaller + "\(slideVal)"
                    
                } else {
                    msgLabel.text = game.nbrGuessedBigger + "\(slideVal)"
                }
            }
            game.nbrOfAttempt += 1
    }
    
    func typeGame(indx: Int){
        
        if(indx == 0){
            
            game.gameType(typeGameis: indx)
            
            sliderOTL.minimumValue = Float(game.minBoud)
            sliderOTL.maximumValue = Float(game.maxBound)
            self.sliderLabel.text = String(self.game.minBoud)
            
            minLabel.text = String(game.minBoud)
            maxLabel.text = String(game.maxBound)
            tentative.text = "0/\(game.maxAttempt)"
            
            print(game.nbrOfAttempt)
            print(game.maxAttempt)
            
            sliderOTL.isEnabled = true
            checkButton.isEnabled = true
            
        }else if (indx == 1){
            
            game.gameType(typeGameis: indx)
            
            sliderOTL.minimumValue = Float(game.minBoud)
            sliderOTL.maximumValue = Float(game.maxBound)
            self.sliderLabel.text = String(self.game.minBoud)
            
            minLabel.text = String(game.minBoud)
            maxLabel.text = String(game.maxBound)
            tentative.text = "0/\(game.maxAttempt)"
            
            checkButton.isEnabled = true
            sliderOTL.isEnabled = true
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        contextualMenu()
        
        checkButton.isEnabled = false

        minLabel.text = String(0)
        maxLabel.text = String(0)
        tentative.text = String(0)
        
        minSlider.text = String(0)
        maxSlider.text = String(0)
        
        
        // StacViews styles
        gameInfosSV.layer.cornerRadius = 15
        sViewInfo1.layer.cornerRadius = 10
        sViewInfo2.layer.cornerRadius = 10
        checkButton.layer.cornerRadius = 10
        btnContextualMenu.layer.cornerRadius = 10
        
        sliderOTL.isEnabled = false
    }
    
    func contextualMenu() {
        let partieClassique = UIAction(title: "Classique 🖲", image:nil) { (action) in
                        
            self.btnContextualMenu.setTitle("Classique", for: .normal)
            self.msgLabel.text = ""

            self.checkButton.backgroundColor = UIColor.systemGreen
            self.typeGame(indx: 0)
            
            self.sliderOTL.value = Float(self.game.minBoud)

            
            self.minSlider.text = String(self.game.minBoud)
            self.maxSlider.text = String(self.game.maxBound)
                  }
        
        let partieRapide = UIAction(title: "Rapide 🚀", image:nil) { (action) in
            
            self.btnContextualMenu.setTitle("Rapide", for: .normal)
     
            self.msgLabel.text = ""

            self.checkButton.backgroundColor = UIColor.systemGreen
            self.typeGame(indx: 1)
            
            self.minSlider.text = String(self.game.minBoud)
            self.maxSlider.text = String(self.game.maxBound)
        }
        
        
        let menu =  UIMenu(title: "Game", options: .displayInline, children: [partieClassique, partieRapide])

        btnContextualMenu.menu = menu
        btnContextualMenu.showsMenuAsPrimaryAction = true
        
    }
    
    
    
}

