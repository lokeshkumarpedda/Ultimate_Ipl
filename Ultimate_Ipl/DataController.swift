//
//  DataController.swift
//  Ultimate_Ipl
//
//  Created by BridgeLabz on 21/11/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit
class DataController {
    var givingDataProtocol : TeamDataGetting?
    var playerDataProtocol : PlayerDataGetting?
    var servicesObj : ApiRequest?
    
    init(withProtocol  obj: TeamDataGetting) {
        givingDataProtocol = obj
        servicesObj = ApiRequest(withProtocol: self)
    }
    
    init(withProtocol  obj: PlayerDataGetting) {
        playerDataProtocol = obj
        servicesObj = ApiRequest(withProtocol: self)
    }
    
    
    func getTeamInfo() {
        if Database.isDBEmpty(){
            servicesObj?.fetchTeamData()
        }
        else{
            getDataFromDatabase()
        }
    }
    
    func getPlayerInfo(for team: String){
        if Database.isPlayersForTeamEmpty(team: team){
            servicesObj?.fetchPlayerData(forTeam: team)
        }
        else{
            self.givePlayerData(players: Database.getPlayers(of: team))
        }
    }
    
    func givePlayerData(players : [Player]){
        playerDataProtocol?.playerDataToViewModel(players: players)
    }
}
extension DataController : FromServices{
    func giveDataToController(team : [TeamLogos]){
        givingDataProtocol?.dataToViewModel(team : team)
    }
    
    func getDataFromDatabase() {
        giveDataToController(team: Database().getTeamsFromDB())
    }
    
    func gotThePlayers(forTeam team:String){
        self.getPlayerInfo(for: team)
    }
}
