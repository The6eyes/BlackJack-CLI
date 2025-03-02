//
//  main.swift
//  BlackJack-Fred
//
//  Created by Fred Saffold on 12/9/24.
//

import Foundation

// Blackjack is a card game where the goal is to get your card total as close to 21 as possible without going over.

// Players are dealt cards and they can choose to "hit" (take another card) or "stand" (keep their current hand)

// The dealer (computer) also plays and tries to beat the players total without going over 21.

// Win condition: Get 21 or closest to 21 without going over.

//Blackjack uses cards with values from 2 to 11 - face cards are 10, Ace is 11

var playAgain = true

func dealCard() -> Int {
    let cardValues = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]
    return cardValues.randomElement()!
}


while playAgain {
    print("\nWelcome to Blackjack❗️🃏")
    print("")
    
    print("\nRules:")
    print("- Try to get as close to 21 as possible without going over.")
    print("- The dealer also draws cards and tries to beat your total.")
    print("- If you or the dealer go over 21, you bust and lose the round.")
    print("- If you have a higher total than the dealer without busting, you win!")
    print("")
    
    var playerHand = 0
    var dealerHand = 0
    var isPlayerTurn = true
    
    let  playerCard1 = dealCard()
    let playerCard2 = dealCard()
    
    playerHand += playerCard1 + playerCard2
    
    let dealerCard1 = dealCard()
    let dealerCard2 = dealCard()
    
    dealerHand += dealerCard1 + dealerCard2
    
    print("Your total is: \(playerHand). You drew a \(playerCard1) and a \(playerCard2).")

    print("")
    
    print("The dealer's visible card is: \(dealerCard1). The other card is hidden.")
    
    while isPlayerTurn {
        print("\nDo you want to 'hit' or 'stand'?: type 'hit' or 'stand':", terminator: " ")
        if let choice = readLine()?.lowercased() {
            print("")
            if choice == "hit" || choice == "h" {
                let newCard = dealCard()
                playerHand += newCard
                print("You drew a \(newCard). Your total is now \(playerHand).")
                if playerHand > 21 {
                    print("Bust❗️ You went over 21‼️ 🥲")
                    isPlayerTurn = false
                }
            } else if choice == "stand" || choice == "s" {
                print("You chose to stand with a total of \(playerHand).")
                isPlayerTurn = false
            }
        } else {
            print("Invalid choice! Please type 'hit/h'or 'stand/s'.")
        }
    }
    if playerHand <= 21 {
        print("\nDealer's turn❗️")
        print("")
        print("The dealer's starting total is \(dealerHand)")
        print("")
        
        while dealerHand < 16 {
            let newcard = dealCard()
            dealerHand += newcard
            print("Dealer drew a \(newcard). Dealer's total is now \(dealerHand).")
        }
        if dealerHand > 21 {
            print("The dealer busts❗️ You win‼️ 🥳🎉")
        } else {
            print("")
            print("The dealer stands with a total of \(dealerHand).")
        }
    }
    print("")
  
    if playerHand <= 21 && dealerHand <= 21 {
        if playerHand > dealerHand {
            print("")
            print("You win❗️🥳 Your \(playerHand) beats the dealer's \(dealerHand).")
        } else if playerHand < dealerHand {
            print("You lose‼️ The dealer's \(dealerHand) beats your \(playerHand).")
        } else {
            print("It's a tie❗️ You both have \(playerHand).")
        }
    }
    
    while true {
        print("")
        print("Do you want to play again❓ (yes/no)", terminator: " ")
        if let response = readLine()?.lowercased() {
            if response == "yes" || response == "y" {
                playAgain = true
                break
            } else if response == "no" || response == "n" {
                playAgain = false
                break
            } else {
                print("")
                print("Invalid response. Please choose yes or no.")
            }
        }
    }
}
print("")
print("Thanks for playing❗️😊 Goodbye❗️")

/*
 - Print the rules
 - Correct the spacing
 - Maybe tell the player the dealers first card
*/


