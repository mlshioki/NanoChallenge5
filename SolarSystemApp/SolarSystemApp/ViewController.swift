//
//  ViewController.swift
//  SolarSystemApp
//
//  Created by Rodrigo Ryo Aoki on 22/02/21.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()

            scrollView.delegate = self
            scrollView.minimumZoomScale = 1.0;
            scrollView.maximumZoomScale = 3.0
            scrollView.zoomScale = 1.0
        
            setCornerRadius()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {

        return thisView
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

}

