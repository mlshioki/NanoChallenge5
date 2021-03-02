//
//  DetailedScreenViewController.swift
//  SolarSystemApp
//
//  Created by Rodrigo Ryo Aoki on 24/02/21.
//

import UIKit

class DetailedScreenMoonViewController: UIViewController {

    var id: String = ""
    
    @IBOutlet var moonImage: UIImageView!
    @IBOutlet weak var moonName: UILabel!
    @IBOutlet weak var size: UILabel!
    @IBOutlet weak var gravity: UILabel!
    @IBOutlet weak var discoveryDate: UILabel!
    @IBOutlet weak var alternativeName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let data = getData(from: id, fullUrl: true)
        
        id = data.englishName ?? "???"
        
        moonImage.image = UIImage(named: id)
        
        if((moonImage.image) == nil){
            moonImage.image = UIImage(named: "Moon")
        }
        
        moonName.text = "\(data.englishName ?? "???")"
        size.text = "Size (Mean Radius): \(data.meanRadius ?? 0)"
        gravity.text = "Gravity: \(data.gravity ?? 0)"
        discoveryDate.text = "Discovery Date: \(data.discoveryDate ?? "???")"
        alternativeName.text = "Alternative Name: \(data.alternativeName ?? "???")"
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
