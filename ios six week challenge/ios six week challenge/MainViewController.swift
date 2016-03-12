//
//  MainViewController.swift
//  ios six week challenge
//
//  Created by youcef bouhafna on 3/11/16.
//  Copyright © 2016 Youcef. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var player2TextField: UITextField!

    @IBOutlet weak var player1TextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addButtonTapped(sender: AnyObject) {
        
            let newPlayer = Players(player1: self.player1TextField.text!, player2: self.player2TextField.text!)
            PlayerController.sharedInstance.addPlayer(newPlayer)
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    func update(player: Players) {
//        self.player1TextField.text = player.player1
//        self.player2TextField.text = player.player2
//        
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
