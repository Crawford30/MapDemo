//
//  ViewController.swift
//  MapDemo
//
//  
//  Copyright © 2020 RTS. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import CoreLocation

class ViewController: UIViewController {
     let locationManager = CLLocationManager()

    @IBOutlet weak var LoginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getCurrentLocation()
    }
    
    @IBAction func LogInBtn(_ sender: UIButton) {
        getCurrentLocation()
    }
    
    
    ////======function to get user location===========
       func getCurrentLocation() {
           //====ask for authorisation from the user===
           self.locationManager.requestAlwaysAuthorization()
           
           //===for use in foreground===
           self.locationManager.requestWhenInUseAuthorization()
           
           if CLLocationManager.locationServicesEnabled() {
               locationManager.delegate = (self as CLLocationManagerDelegate)
               locationManager.desiredAccuracy = kCLLocationAccuracyBest
               locationManager.startUpdatingLocation()
           }
       }

}


extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
           guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
           print("locations = \(locValue.latitude) \(locValue.longitude)")
      
    }
}
