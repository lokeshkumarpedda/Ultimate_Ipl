//
//  PlayerDetails.swift
//  Ultimate_Ipl
//
//  Created by BridgeLabz on 23/11/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class PlayerDetails: UIViewController {

    
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerRole: UILabel!
    @IBOutlet weak var dateOfBirth: UILabel!
    @IBOutlet weak var battingStyle: UILabel!
    @IBOutlet weak var bowlingStyle: UILabel!
    @IBOutlet weak var nationality: UILabel!
    
    var player : Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let player = player else {
            return
        }
        playerName.text = player.name
        playerRole.text = player.role
        dateOfBirth.text = player.dateOfBirth
        battingStyle.text = player.battingStyle
        bowlingStyle.text = player.bowlingStyle
        nationality.text = player.nationality
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
