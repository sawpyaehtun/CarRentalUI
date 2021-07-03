//
//  CarDetailInfoTableViewCell.swift
//  iOSUITest
//
//  Created by Tamron iMac 001 on 7/3/21.
//

import UIKit
import MapKit
import CoreLocation

class CarDetailInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionViewImgSlider: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var mapView: MKMapView!
    
    let manager = CLLocationManager()
    
    var numberOfPage = 3
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        setupUI()
        setupLocationManager()
    }
    
    private func setupLocationManager(){
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func setupUI(){
        pageControl.numberOfPages = numberOfPage
        pageControl.currentPage = 0
        
        collectionViewImgSlider.delegate = self
        collectionViewImgSlider.dataSource = self
        collectionViewImgSlider.isPagingEnabled = true
        collectionViewImgSlider.registerForCells(cells: CarImageCollectionViewCell.self)
        collectionViewImgSlider.reloadData()
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

//MARK:- collectionView delegate and dataSource
extension CarDetailInfoTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return carImageItem(indexPath: indexPath)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / collectionViewImgSlider.frame.width)
    }
}

//MARK:- items for collectionView
extension CarDetailInfoTableViewCell {
    private func carImageItem(indexPath : IndexPath) -> UICollectionViewCell {
        let item = collectionViewImgSlider.dequeReuseCell(type: CarImageCollectionViewCell.self, indexPath: indexPath)
        return item
    }
}

//MARK:- CollectionViewDelegateFlowLayout
extension CarDetailInfoTableViewCell : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width   : CGFloat   = self.collectionViewImgSlider.frame.size.width
        let height  : CGFloat   = self.collectionViewImgSlider.frame.size.height
        return CGSize(width: width, height: height)
    }
}

extension CarDetailInfoTableViewCell : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            showCurrentLocationPin(location)
        }
    }
}
