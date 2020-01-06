//
//  MapVC.swift
//  MapDemo
//
//  Created by JOEL CRAWFORD on 02/01/2020.
//  Copyright © 2020 RTS. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import CoreLocation
import MapKit

class MapVC: UIViewController {
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var txtSearch: UITextField!
    //=====IB Action on a textfield for search==
    @IBAction func locationTapped(_ sender: UITextField) {
        gotoPlaces()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //=====adding map view initial setting,google maps SDK compass ===
        mapView.settings.compassButton = true
        //=====google map user location
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        
    }
    
    //====method to go to places========
    func gotoPlaces() {
        txtSearch.resignFirstResponder()
               let acController = GMSAutocompleteViewController()
               acController.delegate = self
               present(acController, animated: true, completion: nil)
    }
    

    

}


extension MapVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
           guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
           print("locations = \(locValue.latitude) \(locValue.longitude)")
       // lblLocation.text = "latitude = \(locValue.latitude), longitude = \(locValue.longitude)"
    }
}

extension MapVC: GMSAutocompleteViewControllerDelegate {
    //============auto added functio after adding the GMSGeoder====
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        
        
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        
        // Get the place name from 'GMSAutocompleteViewController'
        // Then display the name in textField
        
        print("Place name: \(String(describing: place.name))")
        // Dismiss the GMSAutocompleteViewController when something is selected
            dismiss(animated: true, completion: nil)
            
            self.mapView.clear()
            self.txtSearch.text = place.name
            
            /*
            let placeGmap = GoogleMapObjects()
            placeGmap.lat = place.coordinate.latitude
            placeGmap.long = place.coordinate.longitude
            placeGmap.address = place.name*/
            
            //self.delegate?.getThePlaceAddress(vc: self, place: placeGmap, tag: self.FieldTag)
        
            let cord2D = CLLocationCoordinate2D(latitude: (place.coordinate.latitude), longitude: (place.coordinate.longitude))
       let geocoder = GMSGeocoder()
        geocoder.reverseGeocodeCoordinate(cord2D) { (placemarkers, error) -> Void in
            if error != nil {
                print("reverse geodcode fail: \(error!.localizedDescription)")
                
            } else {
                if let places = placemarkers?.results() {
                    if let place = places.first {
                        if let lines = place.lines {
                        print("GEOCODE: Formatted Address: \(lines)")
                    }
                } else {
                    print("GEOCODE: nil first in places")
                }
            } else {
                print("GEOCODE: nil in places")
            }
            
            }
        
            //creating a GMSMarker object
            let marker = GMSMarker()
            marker.position =  cord2D
            marker.title = "Location"
            marker.snippet = place.name
            
        
        //setting custome image for the marker
            let markerImage = UIImage(named: "icon_offer_pickup")!
            let markerView = UIImageView(image: markerImage)
            marker.iconView = markerView
            marker.map = self.mapView
        
            //setting zoom
            self.mapView.camera = GMSCameraPosition.camera(withTarget: cord2D, zoom: 15)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        //handle error
        print(error.localizedDescription)
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        // Dismiss when the user canceled the action
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
}

}

