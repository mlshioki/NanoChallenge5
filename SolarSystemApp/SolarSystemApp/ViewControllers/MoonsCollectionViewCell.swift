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
        
        let data = request?.bodies.filter({$0.name == moon.moon})[0]
        
        moonImg.image = UIImage(named: (data?.englishName)!)
        moonName.text = data?.englishName
        
        moonImg.isAccessibilityElement = true
        moonImg.accessibilityLabel = "\(moonName.text!)"
        moonImg.accessibilityHint = "Double tap to open the details of this moon"
        
        if((moonImg.image) == nil){
            moonImg.image = UIImage(named: "Moon")
        }
    }
}
