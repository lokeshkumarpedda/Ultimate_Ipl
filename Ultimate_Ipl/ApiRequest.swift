//
//  ApiRequest.swift
//  Ultimate_Ipl
//
//  Created by BridgeLabz on 21/11/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
class ApiRequest {
    var servicesProtocol : FromServices?
    init(withProtocol obj: FromServices) {
        servicesProtocol = obj
    }
    
    //for fetching team data
    func fetchTeamData()  {
        let ref = FIRDatabase.database().reference()
        
        ref.child("teams").observeSingleEvent(of: .value, with: { (snapshot) in
            let teamsData = snapshot.value as! [NSDictionary]
            for eachTeam in teamsData.enumerated(){
                let team = eachTeam.element as! NSDictionary
                self.fetchLogoImage(withTeam: team["team_name"] as! String, reference: team["team_img_url"] as! String,totalTeams : teamsData.count)
            }
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func fetchLogoImage(withTeam name: String, reference image : String , totalTeams : Int){
        let storage = FIRStorage.storage().reference()
        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        storage.child(image).data(withMaxSize: 1 * 1024 * 1024) { (data, error) -> Void in
            if (error != nil) {
                // Uh-oh, an error occurred!
            } else {
                let logo: String = Utility.encodeImageBase64(image: UIImage(data: data!)!)
                
                Database.saveTeamToDB(name: name, logo: logo)
            }
        }
        
    }
    
    
    //for fetching team data
    func fetchPlayerData(forTeam name: String)  {
        let ref = FIRDatabase.database().reference()
        
        ref.child("players").child(name).observeSingleEvent(of: .value, with: { (snapshot) in
            let playersData = snapshot.value as! [NSDictionary]
            
        }) { (error) in
            print(error.localizedDescription)
        }
    }
}
