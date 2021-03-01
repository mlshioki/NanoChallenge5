//
//  PlanetsViewController.swift
//  SolarSystemApp
//
//  Created by Sayuri Hioki on 25/02/21.
//

import UIKit

class PlanetsScreen: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var moonsCV: UICollectionView!
    
    var id: String = "Saturn"
    var moonsList: [Moon] = []
    let moonIdentifier = "MoonViewSegueIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moonsCV.delegate = self
        moonsCV.dataSource = self
        
        let data = getData(from: id)
        moonsList = data.moons ?? []
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let moon = sender as! Moon
        if let vc = segue.destination as? DetailedScreenMoonViewController{
            vc.id = moon.moon!
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moonsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if let Mooncell = moonsCV.dequeueReusableCell(withReuseIdentifier:"moonCell", for: indexPath) as? MoonsCollectionViewCell{
            Mooncell.configure(with: moonsList[indexPath.item])
            
            cell = Mooncell
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let moon = moonsList[indexPath.item]
        performSegue(withIdentifier: moonIdentifier, sender: moon)
    }
}
