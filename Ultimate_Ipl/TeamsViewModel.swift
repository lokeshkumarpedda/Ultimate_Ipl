//
//  TeamsViewModel.swift
//  Ultimate_Ipl
//
//  Created by BridgeLabz on 21/11/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class TeamsViewModel {
    var reloadingProtocol : PReloading?
    var controllerObj : DataController?
    
    var mTeamLogos = [TeamLogos]()

    init(withProtocol  obj: PReloading) {
        reloadingProtocol = obj
        controllerObj = DataController(withProtocol: self)
    }
    
    
    
    func getTeamData() {
        controllerObj?.getTeamInfo()
    }
    
    
    //gives view the rows we required
    func numberOfRows() -> Int{
        return mTeamLogos.count
    }
    
    //gives the image
    func getTeamLogo(index : Int) -> UIImage{
       return Utility.decodeImagefromBase64(strBase64: mTeamLogos[index].teamLogo!)
    }
    
    //gives team name
    func getTeamName(index: Int) -> String{
        return mTeamLogos[index].teamName!
    }
    
}
extension TeamsViewModel : TeamDataGetting{
    func dataToViewModel(team : [TeamLogos]){
        mTeamLogos = team
        reloadingProtocol?.reloadView()
    }
}
