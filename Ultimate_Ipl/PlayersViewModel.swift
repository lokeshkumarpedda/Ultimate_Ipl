//
//  PlayersViewModel.swift
//  Ultimate_Ipl
//
//  Created by BridgeLabz on 23/11/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class PlayersViewModel {
    var playersDetails = [Player]()
    var reloadingProtocol : PReloading?
    var controllerObj : DataController?
    init(obj: PReloading) {
        reloadingProtocol = obj
        controllerObj = DataController(withProtocol: self)
    }
    
    func getPlayers(teamName: String){
        controllerObj?.getPlayerInfo(for: teamName)
    }
    
    
    func numberOfPlayers() -> Int {
        return playersDetails.count
    }
    
    func getPlayerName(forIndex index: Int) -> String {
        return playersDetails[index].name!
    }
    
    func getPlayer(forIndex index:Int) -> Player{
        return playersDetails[index]
    }
}

extension PlayersViewModel : PlayerDataGetting{
    
    func playerDataToViewModel(players : [Player]){
        playersDetails = players
        reloadingProtocol?.reloadView()
    }
}
