//
//  TeamLogos.swift
//  Ultimate_Ipl
//
//  Created by BridgeLabz on 21/11/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

// Model for team logos

class TeamLogos{
    var teamName : String?
    var teamLogo : String?
    
    init(Team name: String ,withImageUrl url :String) {
        teamName = name
        teamLogo = url
    }
}
