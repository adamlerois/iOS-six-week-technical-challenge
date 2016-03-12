//
//  PlayerController.swift
//  ios six week challenge
//
//  Created by youcef bouhafna on 3/11/16.
//  Copyright © 2016 Youcef. All rights reserved.
//

import Foundation

class PlayerController {
    private let playerskey = "players"
    static let sharedInstance = PlayerController()
    var players: [Players]
    init() {
        players = []
        self.loadFromPersistentStorage()
    }
    
    
    func addPlayer(player: Players) {
            players.append(player)
        self.saveToPersistentStorage()
        
    }

    

    func removePlayer(indexPath: NSIndexPath) {
            players.removeAtIndex(indexPath.row)
        
        
    }
    func loadFromPersistentStorage() {
        let unarchivedPlayer = NSKeyedUnarchiver.unarchiveObjectWithFile(self.filePath(playerskey))
        
  

}
    
    func saveToPersistentStorage() {
        
        NSKeyedArchiver.archiveRootObject(self.playerskey, toFile: self.filePath(playerskey))
    }
    
        func filePath(key : String) -> String{
            
            let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true)
            
            let Path: AnyObject = directorySearchResults[0]
            
            let playerPath = Path.stringByAppendingString("/\(key).plist")
            
            return playerPath
            
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


