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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamsVMObj = TeamsViewModel(withProtocol: self)
        teamsVMObj?.getTeamData()
        TeamsCollectionView.backgroundColor = UIColor.clear
        self.view.backgroundColor = UIColor.clear
        mCurrentIndexPath = IndexPath(row: 0, section: 0)
        Timer.scheduledTimer(
            timeInterval: 3,
            target: self,
            selector:#selector(mChangeTheCell) ,
            userInfo: nil,
            repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //for cell movement
    func mChangeTheCell(){
        if (mCurrentIndexPath?.row)! < (teamsVMObj?.numberOfRows())! - 1{
            mCurrentIndexPath?.row = (mCurrentIndexPath?.row)! + 1
            TeamsCollectionView.scrollToItem(at: mCurrentIndexPath!, at: UICollectionViewScrollPosition.centeredHorizontally , animated: true)
        }else if (mCurrentIndexPath?.row)! == (teamsVMObj?.numberOfRows())! - 1{
            mCurrentIndexPath?.row = 0
            TeamsCollectionView.scrollToItem(at: mCurrentIndexPath!, at: UICollectionViewScrollPosition.centeredHorizontally , animated: true)
        }
        
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

}

extension TeamsVC: PReloading{
    func reloadCollectionView(){
        TeamsCollectionView.reloadData()
    }
}
