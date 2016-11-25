//
//  PControllerToViewModel.swift
//  Ultimate_Ipl
//
//  Created by BridgeLabz on 22/11/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

protocol TeamDataGetting {
    func dataToViewModel(team : [TeamLogos])
}

protocol PlayerDataGetting {
    func playerDataToViewModel(players : [Player])
}

protocol PlayerImageGetting {
    func playerImage(image : String)
}


