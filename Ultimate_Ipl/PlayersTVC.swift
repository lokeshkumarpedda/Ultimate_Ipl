//
//  PlayersTVC.swift
//  Ultimate_Ipl
//
//  Created by BridgeLabz on 23/11/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class PlayersTVC: UITableViewController {

    var playersVMobj : PlayersViewModel?
    var mSelectedTeam : String?
    var mSelectedPlayer : Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playersVMobj = PlayersViewModel(obj: self)
        guard let mSelectedTeam = mSelectedTeam else {
            return
        }
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "groundImage")?.draw(in: self.view.bounds)
        
        let backgroundImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        
        playersVMobj?.getPlayers(teamName: mSelectedTeam)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        animateTable()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animateTable() {
        
        let cells = tableView.visibleCells
        let tableHeight: CGFloat = tableView.bounds.size.height
        
        for (index, cell) in cells.enumerated() {
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
            UIView.animate(withDuration: 1.0, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
        }
    }
    
    func colorforIndex(index: Int) -> UIColor {
        
        let itemCount = (playersVMobj?.numberOfPlayers())! - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: color, green: 0.0, blue: 1.0, alpha: 0.5)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (playersVMobj?.numberOfPlayers())!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.PlayerNames.cellIdentifier, for: indexPath)
        cell.textLabel?.text = playersVMobj?.getPlayerName(forIndex: indexPath.row)
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.backgroundColor = UIColor.clear
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mSelectedPlayer = playersVMobj?.getPlayer(forIndex: indexPath.row)
        performSegue(withIdentifier: Constants.PlayerToDetails.segueIdentifier, sender: nil)
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath){
 
        cell.backgroundColor =  self.colorforIndex(index: indexPath.row)
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let playerDetailsObj = segue.destination as! PlayerDetails
        playerDetailsObj.player = mSelectedPlayer
    }
 

}
extension PlayersTVC : PReloading{
    func reloadView(){
        tableView.reloadData()
        self.animateTable()
    }
}
