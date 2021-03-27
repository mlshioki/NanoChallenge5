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
    @IBOutlet var boardView: UIView!
    @IBOutlet var stackView1: UIStackView!
    @IBOutlet var moonsLabel: UILabel!
    
    var moonsList: [Moon] = []
    let moonIdentifier = "MoonViewSegueIdentifier"
    
    var audio = AudioManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let data = request?.bodies.filter({return $0.englishName == id})[0]
        
        planetImage.image = UIImage(named: CheckInfoExists(info: (data?.englishName)!))
        planetName.text = CheckInfoExists(info: (data?.englishName)!)
        size.text = "Size (Mean Radius): \(data?.meanRadius ?? 0) Km"
        gravity.text = "Gravity: \(data?.gravity ?? 0) m/s²"
        discoveryDate.text = "Discovery Date: \(CheckInfoExists(info: (data?.discoveryDate)!))"

        moonsCV.delegate = self
        moonsCV.dataSource = self
        moonsList = data?.moons ?? []
//        moonsCV.collectionViewLayout = createCompositionalLayout()
        
        if(moonsList.count < 1){
            moonsLabel.text = "Moon(s): None"
        }

        stackView1.isAccessibilityElement = true
        stackView1.accessibilityLabel = "\(planetName.text!), \(size.text!), \(gravity.text!), \(discoveryDate.text!)"
        stackView1.accessibilityHint = "Select a moon down below to see the details of it"

        planetImage.isAccessibilityElement = true
        planetImage.accessibilityLabel = "Image of \(planetName.text!)"
    }
    
    @IBAction func backBtn(_ sender: Any) {
        audio.play(sound: .backButton)
        dismiss(animated: true, completion: nil)
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
        if let MoonCell = moonsCV.dequeueReusableCell(withReuseIdentifier:"moonCell", for: indexPath) as? MoonsCollectionViewCell{
            MoonCell.configure(with: moonsList[indexPath.item])

            cell = MoonCell
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        audio.play(sound: .button)
        let moon = moonsList[indexPath.item]
        performSegue(withIdentifier: moonIdentifier, sender: moon)
    }
    
//    func createCompositionalLayout() -> UICollectionViewLayout {
//        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
//            let section = self.moonsList[sectionIndex]
//                return self.createFeaturedSection(using: section)
//        }
//
//
//        let config = UICollectionViewCompositionalLayoutConfiguration()
//        config.interSectionSpacing = 20
//        layout.configuration = config
//        return layout
//    }
//
//    func createFeaturedSection(using section: Moon) -> NSCollectionLayoutSection {
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(0.2))
//
//        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
//        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
//
//        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(350))
//        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])
//
//        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
//        layoutSection.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
//        return layoutSection
//    }
    // Não funciona corretamente, ele scrola de acordo com um tamanho especifico como se fossem paginas
    // Quando chega ao final ele volta pra penultima pagina como se fosse por conta da força propria
}
