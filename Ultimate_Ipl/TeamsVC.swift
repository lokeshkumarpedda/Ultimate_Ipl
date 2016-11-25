//
//  ViewController.swift
//  Ultimate_Ipl
//
//  Created by Lokesh Kumar on 21/11/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class TeamsVC: UIViewController {

    @IBOutlet weak var TeamsCollectionView: UICollectionView!
    
    
    var teamsVMObj : TeamsViewModel?
    var mCurrentIndexPath : IndexPath?
    var mSelectedTeam : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamsVMObj = TeamsViewModel(withProtocol: self)
        teamsVMObj?.getTeamData()
        TeamsCollectionView.backgroundColor = UIColor.clear
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "groundImage")?.draw(in: self.view.bounds)
        
        let backgroundImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TeamsVC : UICollectionViewDataSource{
    
    
    //number of rows
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        //unwrapping the view model object optionals
        guard let teamsVMObj = teamsVMObj else {
            return 0
        }
        return teamsVMObj.numberOfRows()
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        //creating reusable cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.TeamsLogo.cellIdentifier, for: indexPath) as! TeamLogosCVCell
        cell.logoImageView.image = teamsVMObj?.getTeamLogo(index: indexPath.row)
        
        return cell
    }
  
}
extension TeamsVC : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath){
        let width: CGFloat = collectionView.bounds.size.width
        cell.transform = CGAffineTransform(translationX: 0, y: -width)
        cell.alpha = 0
        UIView.animate(withDuration: 1.5, delay: 0.05 * Double(indexPath.row), usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [], animations: {
            cell.alpha = 1
            cell.transform = CGAffineTransform(translationX: 0, y: 0);
            
        }, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        mSelectedTeam = teamsVMObj?.getTeamName(index: indexPath.row)
        performSegue(withIdentifier: Constants.TeamToPlayers.segueIdentifier, sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let playersTVCObj = segue.destination as! PlayersTVC
        playersTVCObj.mSelectedTeam = self.mSelectedTeam
    }
    
}

extension TeamsVC: PReloading{
    func reloadView(){
        
        TeamsCollectionView.reloadData()
    }
}
