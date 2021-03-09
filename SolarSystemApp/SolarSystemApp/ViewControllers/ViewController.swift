//
//  ViewController.swift
//  SolarSystemApp
//
//  Created by Rodrigo Ryo Aoki on 22/02/21.
//

import UIKit
import AVFoundation
import Foundation

var request: AllBodies?

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var audio = AudioManager()

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var thisView: UIView!
    
    @IBOutlet weak var sun: UIButton!
    @IBOutlet weak var mercury: UIButton!
    @IBOutlet weak var venus: UIButton!
    @IBOutlet weak var earth: UIButton!
    @IBOutlet weak var mars: UIButton!
    @IBOutlet weak var jupiter: UIButton!
    @IBOutlet weak var saturn: UIButton!
    @IBOutlet weak var uranus: UIButton!
    @IBOutlet weak var neptune: UIButton!
    
    @IBOutlet var popUpView: UIView!
    @IBOutlet var blurView: UIVisualEffectView!
    
    @IBAction func helpBtn(_ sender: Any) {
        audio.play(sound: .button)
        animateIn(x: blurView)
        animateIn(x: popUpView)
    }
    
    @IBOutlet weak var okBtn: UIButton!
    @IBAction func okBtn(_ sender: Any) {
        animateOut(x: popUpView)
        animateOut(x: blurView)
        UserDefaultManager.shared.storeValue(forKey: .alreadyOpened, value: true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        request = getData(from: "https://api.le-systeme-solaire.net/rest/bodies", fullUrl: true)
        
            scrollView.delegate = self
            scrollView.minimumZoomScale = 1.0;
            scrollView.maximumZoomScale = 3.0
            scrollView.zoomScale = 1.0
        
            setCornerRadius()
        
        blurView.bounds = self.view.bounds
        popUpView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        
        okBtn.layer.cornerRadius = 10
        
        if !(UserDefaultManager.shared.getIsFirstTime(forKey: .alreadyOpened)) {
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) {_ in
                self.helpBtn(self)
            }
        }
        
    }
    @IBAction func SunBtn(_ sender: Any) {
        OpenDetailPlanet(planet: "Sun")
    }
    @IBAction func MercuryBtn(_ sender: Any) {
        OpenDetailPlanet(planet: "Mercury")
    }
    @IBAction func VenusBtn(_ sender: Any) {
        OpenDetailPlanet(planet: "Venus")
    }
    @IBAction func EarthBtn(_ sender: Any) {
        OpenDetailPlanet(planet: "Earth")
    }
    @IBAction func MarsBtn(_ sender: Any) {
        OpenDetailPlanet(planet: "Mars")
    }
    @IBAction func JupiterBtn(_ sender: Any) {
        OpenDetailPlanet(planet: "Jupiter")
    }
    @IBAction func SaturnBtn(_ sender: Any) {
        OpenDetailPlanet(planet: "Saturn")
    }
    @IBAction func UranusBtn(_ sender: Any) {
        OpenDetailPlanet(planet: "Uranus")
    }
    @IBAction func NeptuneBtn(_ sender: Any) {
        OpenDetailPlanet(planet: "Neptune")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {

        return thisView
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let vc = segue.destination as? PlanetsScreen{
            vc.id = sender as! String
        }
        else if let vc = segue.destination as? DetailedScreenMoonViewController {
            vc.id = sender as! String
        }
    }
    
    func OpenDetailPlanet(planet: String){
        audio.play(sound: .button)
        performSegue(withIdentifier: "goToPlanetsView", sender: planet)
    }
    
    func setCornerRadius(){
        sun.layer.cornerRadius = 100.0
        mercury.layer.cornerRadius = 100.0
        venus.layer.cornerRadius = 100.0
        earth.layer.cornerRadius = 100.0
        mars.layer.cornerRadius = 100.0
        jupiter.layer.cornerRadius = 100.0
        saturn.layer.cornerRadius = 100.0
        uranus.layer.cornerRadius = 100.0
        neptune.layer.cornerRadius = 100.0
    }

    //function to create the animation when the popUp appears
    func animateIn(x: UIView){
        let backgroundView = self.view!
        
        backgroundView.addSubview(x)
        
        x.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        x.alpha = 0
        x.center = backgroundView.center
        
        
        UIView.animate(withDuration: 0.4, animations: {
            x.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            x.alpha = 1
        })
    }
    
    //function to create the animation when the popUp disappears
    func animateOut(x: UIView){
        UIView.animate(withDuration: 0.4, animations: {
            x.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            x.alpha = 0
        }, completion: { _ in
            x.removeFromSuperview()
        })
    }
}

