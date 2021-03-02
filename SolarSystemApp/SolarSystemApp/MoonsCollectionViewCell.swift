//
//  MoonsCollectionViewCell.swift
//  SolarSystemApp
//
//  Created by Sayuri Hioki on 01/03/21.
//

import UIKit

class MoonsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var moonImg: UIImageView!
    @IBOutlet weak var moonName: UILabel!
    
    
    func configure(with moon: Moon){
        
        let data = getData(from: moon.rel!, fullUrl: true)
        
        moonImg.image = UIImage(named: moon.moon!)
        moonName.text = data.englishName
        
        if((moonImg.image) == nil){
            moonImg.image = UIImage(named: "Moon")
        }
    }
}
