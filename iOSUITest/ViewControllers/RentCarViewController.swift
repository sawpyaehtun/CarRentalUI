//
//  RentCarViewController.swift
//  iOSUITest
//
//  Created by Tamron iMac 001 on 7/3/21.
//

import UIKit
import MapKit
import CoreLocation

class RentCarViewController: BaseViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var btnGo: UIButton!
    
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func setupUI() {
        super.setupUI()
        hideNavigationBar()
        
        btnGo.layer.cornerRadius = 10
        btnGo.layer.maskedCorners = [.layerMaxXMaxYCorner]
        
        setupLocationManager()
    }
    
    private func setupLocationManager(){
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    @IBAction func didTapBtnGo(_ sender: Any) {
        let vc = SearchResultViewController.init()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func showCurrentLocationPin(_ location : CLLocation){
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        mapView.setRegion(region, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
    }
    
}


extension RentCarViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            showCurrentLocationPin(location)
        }
    }
}
