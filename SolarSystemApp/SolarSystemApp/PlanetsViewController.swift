//
//  PlanetsViewController.swift
//  SolarSystemApp
//
//  Created by Sayuri Hioki on 25/02/21.
//

import UIKit

class PlanetsScreen: UIViewController, changePlanetsScreen{
    
    func changeToPlanetsDetail(id: String, sender: Any?) {
        self.id = id
//        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "goToPlanetsView") as! PlanetsScreen
//        self.navigationController?.pushViewController(secondViewController, animated: true)
        
    }
    
    
    var id: String = ""
    
    @IBOutlet var planetImage: UIImageView!
    @IBOutlet var planetName: UILabel!
    @IBOutlet var size: UILabel!
    @IBOutlet var gravity: UILabel!
    @IBOutlet var discoveryDate: UILabel!
    @IBOutlet var alternativeName: UILabel!
    @IBOutlet var moonsCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let data = getData(from: id)
        
        planetImage.image = UIImage(named: id)
        planetName.text = "\(data.englishName ?? "???")"
        size.text = "Size (Mean Radius): \(data.meanRadius ?? 0)"
        gravity.text = "Gravity: \(data.gravity ?? 0)"
        discoveryDate.text = "Discovery Date: \(data.discoveryDate ?? "???")"
        alternativeName.text = "Alternative Name: \(data.alternativeName ?? "???")"
    }
}
