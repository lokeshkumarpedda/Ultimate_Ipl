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
    var servicesObj : ApiRequest?
    
    init(withProtocol  obj: TeamDataGetting) {
        givingDataProtocol = obj
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
}
extension DataController : FromServices{
    func giveDataToController(team : [TeamLogos]){
        givingDataProtocol?.dataToViewModel(team : team)
    }
    
    func getDataFromDatabase() {
        giveDataToController(team: Database().getTeamsFromDB())
    }
}
