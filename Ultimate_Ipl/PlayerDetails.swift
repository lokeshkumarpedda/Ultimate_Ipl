//
//  PlayerDetails.swift
//  Ultimate_Ipl
//
//  Created by BridgeLabz on 23/11/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class PlayerDetails: UIViewController {

    @IBOutlet weak var playerImage: UIImageView!
    
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerRole: UILabel!
    @IBOutlet weak var dateOfBirth: UILabel!
    @IBOutlet weak var battingStyle: UILabel!
    @IBOutlet weak var bowlingStyle: UILabel!
    @IBOutlet weak var nationality: UILabel!
    
    var player : Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "groundImage")?.draw(in: self.view.bounds)
        
        let backgroundImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        
        
        
        guard let player = player else {
            return
        }
        let playerDetailVMObj = PlayerDetailsViewModel(obj: self)
        playerDetailVMObj.getImage(withUrl: player.profilePictureUrl!)
        
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
extension PlayerDetails : PInformView{
    
    func withTheimage(image : UIImage){
        playerImage.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
        playerImage.image = image
        UIView.animate(withDuration: 1, animations: {
            self.playerImage.layer.transform = CATransform3DMakeScale(1.05, 1.05, 1)
        },completion:{ finished in
            UIView.animate(withDuration: 0.1, animations: {
                self.playerImage.layer.transform = CATransform3DMakeScale(1, 1, 1)
            })
        })
        
    }
}
