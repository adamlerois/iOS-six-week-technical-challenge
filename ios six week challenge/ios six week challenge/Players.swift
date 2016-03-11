//
//  Players.swift
//  ios six week challenge
//
//  Created by youcef bouhafna on 3/11/16.
//  Copyright © 2016 Youcef. All rights reserved.
//

import Foundation
class Players: Equatable {
    
    private let Kplayer1 = "player1"
    private let Kplayer2 = "player2"
    var player1: String
    var player2: String
    
    init(player1: String, player2: String) {
        self.player1 = player1
        self.player2 = player2
    }
    
    
    init?(dictionary: Dictionary<String, AnyObject>) {
        guard let player1 = dictionary[Kplayer1] as? String,
            player2 = dictionary[Kplayer2] as? String else {
                
                self.player1 = ""
                self.player2 = ""
                return nil
        }
        
        self.player1 = player1
        self.player2 = player2
    }
    
    func dictionaryCopy() -> Dictionary<String, AnyObject> {
        let dictionary = [Kplayer1: self.player1, Kplayer2: self.player2]
        return dictionary
        
    }
    
   
    
    
}
func ==(lhs: Players, rhs: Players) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}