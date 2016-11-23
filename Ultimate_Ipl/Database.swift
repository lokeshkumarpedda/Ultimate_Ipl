//
//  Database.swift
//  Ultimate_Ipl
//
//  Created by BridgeLabz on 22/11/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit
import CoreData
class Database {

    //saving to database
    class func saveTeamToDB(name: String, logo : String) {
        
        var data = [NSManagedObject]()
        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let entity =  NSEntityDescription.entity(forEntityName: "Teams",
                                                 in:managedContext)
        
        let team = NSManagedObject(entity: entity!,
                                     insertInto: managedContext)
        
        team.setValue(name, forKey: "teamName")
        team.setValue(logo, forKey: "teamLogo")
        
        do {
            try managedContext.save()
            
            data.append(team)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    class func savePlayerToDB(name: String, teamName : String,profilePictureUrl: String, role : String,dateOfBirth: String, battingStyle : String,bowlingStyle: String, nationality : String) {
        
        var data = [NSManagedObject]()
        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let entity =  NSEntityDescription.entity(forEntityName: "Players",
                                                 in:managedContext)
        
        let player = NSManagedObject(entity: entity!,
                                   insertInto: managedContext)
        
        player.setValue(name, forKey: "name")
        player.setValue(teamName, forKey: "teamName")
        player.setValue(profilePictureUrl, forKey: "profilePictureUrl")
        player.setValue(role, forKey: "role")
        player.setValue(dateOfBirth, forKey: "dateOfBirth")
        player.setValue(battingStyle, forKey: "battingStyle")
        player.setValue(bowlingStyle, forKey: "bowlingStyle")
        player.setValue(nationality, forKey: "nationality")
        
        do {
            try managedContext.save()
            
            data.append(player)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    //for saving
    class func savePlayerImageToDB(url: String, image : String) {
        
        var data = [NSManagedObject]()
        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let entity =  NSEntityDescription.entity(forEntityName: "PlayerImages",
                                                 in:managedContext)
        
        let player = NSManagedObject(entity: entity!,
                                   insertInto: managedContext)
        
        player.setValue(url, forKey: "imageUrl")
        player.setValue(image, forKey: "image")
        
        do {
            try managedContext.save()
            data.append(player)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    //returns the Team Data
    func getTeamsFromDB() -> [TeamLogos]{
        var teamDataArray = [TeamLogos]()
        var teams = [NSManagedObject]()
        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Teams")
        
        do {
            let results =
                try managedContext.fetch(fetchRequest)
            teams = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        for team in teams{
            let modelObj = TeamLogos(Team: team.value(forKey: "teamName") as! String, withImageUrl: team.value(forKey: "teamLogo") as! String)
            teamDataArray.append(modelObj)
        }
        return teamDataArray
    }
    
    class func getPlayers(of team:String) -> [Player]{
        var allPlayers = [NSManagedObject]()
        var players = [Player]()
        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Players")
        
        let resultPredicate = NSPredicate(format: "teamName = %@", team)
        fetchRequest.predicate = resultPredicate
        do {
            let results =
                try managedContext.fetch(fetchRequest)
            allPlayers = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        for person in allPlayers{
            let modelObj = Player(n: person.value(forKey: "name") as! String, teamname: person.value(forKey: "teamName") as! String, picture: person.value(forKey: "profilePictureUrl") as! String, role: person.value(forKey: "role") as! String, dob: person.value(forKey: "dateOfBirth") as! String, bts: person.value(forKey: "battingStyle") as! String, bws: person.value(forKey: "bowlingStyle") as! String, nation: person.value(forKey: "nationality") as! String)
            players.append(modelObj)
        }
        return players
    }
    
    
    //checking is teams is empty or not
    class func isDBEmpty() -> Bool{
        var teams = [NSManagedObject]()
        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Teams")
        
        do {
            let results =
                try managedContext.fetch(fetchRequest)
            teams = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        if teams.count == 0{
            return true
        }
        else {
            return false
        }
    }
    
    //checking is Players is empty or not
    class func isPlayersForTeamEmpty(team : String) -> Bool{
        var teams = [NSManagedObject]()
        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Players")
        let resultPredicate = NSPredicate(format: "teamName = %@", team)
        fetchRequest.predicate = resultPredicate
        
        do {
            let results =
                try managedContext.fetch(fetchRequest)
            teams = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        if teams.count == 0{
            return true
        }
        else {
            return false
        }
    }
}
