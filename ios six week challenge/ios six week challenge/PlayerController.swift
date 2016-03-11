//
//  PlayerController.swift
//  ios six week challenge
//
//  Created by youcef bouhafna on 3/11/16.
//  Copyright © 2016 Youcef. All rights reserved.
//

import Foundation
import GameKit
class PlayerController {
    private let playerskey = "players"
    static let sharedInstance = PlayerController()
    var players: [Players]
    init() {
        self.players = []
        self.loadFromPersistentStorage()
    }
    
    
    func addPlayer(player: Players) {
            players.append(player)
        self.saveToPersistentStorage()
        
    }

    

    func removePlayer(player: Players) {
        if let playerIndex = players.indexOf(player) {
            players.removeAtIndex(playerIndex)
        }
        
    }
    func loadFromPersistentStorage() {
        let playerDictionariesFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(playerskey) as? [[String: AnyObject]]
        
        if let playerDictionaries = playerDictionariesFromDefaults {
            self.players = playerDictionaries.map({ (Players(dictionary: $0)!)})
}

}
    
    func saveToPersistentStorage() {
        let playerDictionaries = self.players.map({$0.dictionaryCopy()})
        NSUserDefaults.standardUserDefaults().setObject(playerDictionaries, forKey: playerskey)
    }
    
   
    
    func randomizer() {
    let shuffled = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(players)
        
    }
    
    
}
