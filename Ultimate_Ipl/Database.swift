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
        
        let entity =  NSEntityDescription.entity(forEntityName: "Hello",
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
    
    //checking is Database is empty or not
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
}
