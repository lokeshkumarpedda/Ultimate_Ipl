//
//  PServicesToController.swift
//  Ultimate_Ipl
//
//  Created by BridgeLabz on 22/11/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

protocol FromServices {
    func giveDataToController(team : [TeamLogos])
    func getDataFromDatabase()
    
    func gotThePlayers(forTeam team:String)
}
