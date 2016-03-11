//
//  ListTableViewController.swift
//  ios six week challenge
//
//  Created by youcef bouhafna on 3/11/16.
//  Copyright © 2016 Youcef. All rights reserved.
//

import UIKit


class ListTableViewController: UITableViewController {
    var player: [Players] = []

    @IBAction func shuffleButtonTapped(sender: UIButton) {
        
        PlayerController.sharedInstance.randomizer()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

   
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PlayerController.sharedInstance.players.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier", forIndexPath: indexPath)
let player = PlayerController.sharedInstance.players[indexPath.row]
        cell.textLabel?.text = player.player1
        cell.detailTextLabel?.text = player.player2
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        let player = PlayerController.sharedInstance.players[indexPath.row]
        
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
             let player = PlayerController.sharedInstance.players[indexPath.row]
            PlayerController.sharedInstance.removePlayer(player)
            // Delete the row from the data source
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
           
    }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showPlayer" {
            if let destination = segue.destinationViewController as? MainViewController {
                _ = destination.view
                
                let indexPath = tableView.indexPathForSelectedRow
                if let selectedRow = indexPath?.row{
                 let player = PlayerController.sharedInstance.players[selectedRow]
                    destination.update(player)
                
                }
                
                
                
                
                
                
                
            }
        }
    }
    
    

}
