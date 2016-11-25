//
//  PlayerDetailsViewModel.swift
//  Ultimate_Ipl
//
//  Created by BridgeLabz on 24/11/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class PlayerDetailsViewModel : PlayerImageGetting{
    
    var informingViewProtocol : PInformView?
    var controllerObj : DataController?
    
    init(obj : PInformView) {
        informingViewProtocol = obj
        controllerObj = DataController(withProtocol: self)
    }
    
    func getImage(withUrl url: String) {
        controllerObj?.getPlayerImage(forUrl: url)
    }
    
    func playerImage(image : String){
        informingViewProtocol?.withTheimage(image: Utility.decodeImagefromBase64(strBase64: image))
    }
}
