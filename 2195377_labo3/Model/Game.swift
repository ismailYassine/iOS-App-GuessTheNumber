//
//  Jeux.swift
//  2195377_labo3
//
//  Created by Ismail on 2022-04-03.

import Foundation

class Game{
    
    let playerWonMessage = "Gongratulation you won, the the number to Guess was: "
    let playerLostMessage = "Sorry you lost, the number to Guess was: "
    let nbrGuessedSmaller = "The number to guess is higher than: "
    let nbrGuessedBigger = "The number to guess is lower than: "
    
    var nbrOfAttempt = 0
    var nbrToGuess = 0
    
    var minBoud: Int = 0
    var maxBound: Int = 0
    var maxAttempt: Int = 0
    
    // Fonction pour generer un Random
    func randomNumberGenerator(min: Int, max: Int) -> (Int){
        return Int.random(in: min...max)
    }
    
    // Function that manage the type of Game selected
    func gameType(typeGameis: Int){
        
        if (typeGameis == 0){
            minBoud = 1
            maxBound = 100
            maxAttempt = 10
           
        }else if (typeGameis == 1){
            minBoud = 21
            maxBound = 42
            maxAttempt = 3
            
        }
            nbrToGuess = randomNumberGenerator(min: minBoud, max: maxBound)
            print(nbrToGuess)
           
        
    }
}
