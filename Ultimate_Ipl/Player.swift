//
//  Player.swift
//  Ultimate_Ipl
//
//  Created by BridgeLabz on 22/11/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class Player: NSObject
{
    var name : String?
    var teamName : String?
    var profilePictureUrl : String?
    var role : String?
    var dateOfBirth : String?
    var battingStyle : String?
    var bowlingStyle : String?
    var nationality : String?
    
    //Constructor with data
    init(n : String ,teamname : String ,picture : String , role : String , dob : String, bts : String , bws : String , nation : String)
    {
        
        self.name = n
        self.teamName = teamname
        self.profilePictureUrl = picture
        self.role = role
        self.dateOfBirth = dob
        self.battingStyle = bts
        self.bowlingStyle = bws
        self.nationality = nation
        
    }
    
}
