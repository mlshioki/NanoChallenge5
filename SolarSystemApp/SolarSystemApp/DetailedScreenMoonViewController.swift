//
//  DetailedScreenViewController.swift
//  SolarSystemApp
//
//  Created by Rodrigo Ryo Aoki on 24/02/21.
//

import UIKit

class DetailedScreenMoonViewController: UIViewController {

    var id: String?
    
    @IBOutlet var moonImage: UIImageView!
    @IBOutlet weak var moonName: UILabel!
    @IBOutlet weak var size: UILabel!
    @IBOutlet weak var gravity: UILabel!
    @IBOutlet weak var discoveryDate: UILabel!
    @IBOutlet weak var alternativeName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moonImage.image = UIImage(named: "")
        moonName.text = ""
        size.text = ""
        gravity.text = ""
        discoveryDate.text = ""
        alternativeName.text = ""
        
    }
}
