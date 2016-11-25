//
//  TeamLogosCVCell.swift
//  Ultimate_Ipl
//
//  Created by Lokesh Kumar on 21/11/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class TeamLogosCVCell: UICollectionViewCell {
    @IBOutlet weak var logoImageView: UIImageView!
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
    }
}
