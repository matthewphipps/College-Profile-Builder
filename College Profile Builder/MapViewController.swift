//
//  MapViewController.swift
//  College Profile Builder
//
//  Created by mphipps on 2/26/16.
//  Copyright © 2016 aHuesing. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myMap: MKMapView!
    var location = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        geoCodeLocation(location)
    }
    
    @IBAction func SearchButtonTapped(sender: UIButton)
    {
        geoCodeLocation(myTextField.text!)
        myTextField.resignFirstResponder()
    }
    
    func geoCodeLocation(Location : String)
    {
        let myGeoCode = CLGeocoder()
        myGeoCode.geocodeAddressString(Location) { (placeMarks, error) -> Void in
            if error != nil
            {
                print("error")
            }
            else
            {
                self.displayMap((placeMarks?.first)!)
            }
        }
    }
    
    func displayMap(MyPlaceMark: CLPlacemark)
    {
        let myPin = MKPointAnnotation()
        myTextField.text = MyPlaceMark.name
        let myLocation = MyPlaceMark
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake((myLocation.location?.coordinate)!, span)
        myMap.setRegion(region, animated: true)
        myPin.coordinate = (myLocation.location?.coordinate)!
        myPin.title = MyPlaceMark.name
        myMap.addAnnotation(myPin)
    }
}
