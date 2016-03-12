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
    
   
    
    
    
}
extension MutableCollectionType where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffleInPlace() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}


