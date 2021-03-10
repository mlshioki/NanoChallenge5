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
    
    @IBOutlet var stackView: UIStackView!
    
    var audio = AudioManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let data = request?.bodies.filter({$0.name == id})[0]
        
        id = CheckInfoExists(info: (data?.englishName)!)

        moonImage.image = UIImage(named: id)

        if((moonImage.image) == nil){
            moonImage.image = UIImage(named: "Moon")
        }

        moonName.text = "\(CheckInfoExists(info: (data?.englishName)!))"
        size.text = "Size (Mean Radius): \(data?.meanRadius ?? 0) Km"
        gravity.text = "Gravity: \(data?.gravity ?? 0) m/s²"
        discoveryDate.text = "Discovery Date: \(CheckInfoExists(info: (data?.discoveryDate)!))"
        alternativeName.text = "Alternative Name: \(CheckInfoExists(info: (data?.alternativeName)!))"
        
        stackView.isAccessibilityElement = true
        stackView.accessibilityLabel = "\(moonName.text!), \(size.text!), \(gravity.text!), \(discoveryDate.text!), \(alternativeName.text!)"
        
        moonImage.isAccessibilityElement = true
        moonImage.accessibilityLabel = "Image of \(moonName.text!)"
    }
    
    @IBAction func backBtn(_ sender: Any) {
        audio.play(sound: .backButton)
        dismiss(animated: true, completion: nil)
    }
}
