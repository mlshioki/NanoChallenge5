//
//  PlanetsViewController.swift
//  SolarSystemApp
//
//  Created by Sayuri Hioki on 25/02/21.
//

import UIKit
            
class PlanetsScreen: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var moonsCV: UICollectionView!
    
    var id: String = ""
    
    @IBOutlet var planetImage: UIImageView!
    @IBOutlet var planetName: UILabel!
    @IBOutlet var size: UILabel!
    @IBOutlet var gravity: UILabel!
    @IBOutlet var discoveryDate: UILabel!
    @IBOutlet var alternativeName: UILabel!
    
    var moonsList: [Moon] = []
    let moonIdentifier = "MoonViewSegueIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let data = getData(from: id, fullUrl: false)
        
        planetImage.image = UIImage(named: id)
        planetName.text = "\(data.englishName ?? "???")"
        size.text = "Size (Mean Radius): \(data.meanRadius ?? 0)"
        gravity.text = "Gravity: \(data.gravity ?? 0)"
        discoveryDate.text = "Discovery Date: \(data.discoveryDate ?? "???")"
        alternativeName.text = "Alternative Name: \(data.alternativeName ?? "???")"
        
        moonsCV.delegate = self
        moonsCV.dataSource = self
        moonsList = data.moons ?? []
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let moon = sender as! Moon
        if let vc = segue.destination as? DetailedScreenMoonViewController{
            vc.id = moon.rel!
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moonsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if let MoonCell = moonsCV.dequeueReusableCell(withReuseIdentifier:"moonCell", for: indexPath) as? MoonsCollectionViewCell{
            MoonCell.configure(with: moonsList[indexPath.item])
            
            cell = MoonCell
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let moon = moonsList[indexPath.item]
        performSegue(withIdentifier: moonIdentifier, sender: moon)
    }
}
