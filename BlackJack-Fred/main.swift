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

 
// First we will set up our game by making a few variables

var playAgain = true // This will keep track of whether the player wants to play another round


func dealCard() -> Int {
    return Int.random(in: 2...11)
} // This function gives a random number between 2 and 11 representing a card's value. This simulates drawing a card in the game.

// GAME LOOP - we will print our welcome and establish a few variables for the dealers hand the players hand and a boolean to track if it is the players turn or not

while playAgain {
    print("\nWelcome to Blackjack!🃏")
    print("")
    var playerHand = 0
    var dealerHand = 0
    var isPlayerTurn = true
    
    // Now we will deal our initial cards -- each player gets 2 cards to start the game
    playerHand += dealCard()
    playerHand += dealCard()
    dealerHand += dealCard()
    dealerHand += dealCard()
    
    print("Your starting total is: \(playerHand).")
    print("The dealer has a hidden card and one visible card.")
    
    // Now it is the players turn and we will see if the player chooses to "hit" or "stand"
    
    while isPlayerTurn {
        print("\nDo you want to 'hit' or 'stand'?: type 'hit' or 'stand':", terminator: " ")
        if let choice = readLine()?.lowercased() {
            if choice == "hit" || choice == "h" {
                let newCard = dealCard()
                playerHand += newCard
                print("You drew a \(newCard). Your total is now \(playerHand).")
                if playerHand > 21 {
                    print("Bust! You went over 21! 🥲")
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
        print("\nDealer's turn!")
        print("The dealer's starting total is \(dealerHand)")
        
        while dealerHand < 16 {
            let newcard = dealCard()
            dealerHand += newcard
            print("Dealer drew a \(newcard). Dealer's total is now \(dealerHand).")
        }
        if dealerHand > 21 {
            print("The dealer busts! You win! 🥳🎉")
        } else {
            print("The dealer stands with a total of \(dealerHand).")
        }
    }
    // Now we determine the winner
    if playerHand <= 21 && dealerHand <= 21 {
        if playerHand > dealerHand {
            print("You win! Your \(playerHand) beats the dealer's \(dealerHand).")
        } else if playerHand < dealerHand {
            print("You lose! The dealer's \(dealerHand) beats your \(playerHand).")
        } else {
            print("It's a tie! You bother have \(playerHand).")
        }
    }
    //Play again loop
    while true {
        print("")
        print("Do you want to play again? (yes/no)", terminator: " ")
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
print("Thanks for playing! Goodbye!")

/*
 - Print the rules
 - Correct the spacing
 - Maybe tell the player the dealers first card
*/


