//
//  MapaViewController.swift
//  appTampico
//
//  Created by ITESM CAMPUS TAMPICO on 30/09/16.
//  Copyright © 2016 ITESM CAMPUS TAMPICO. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapaViewController: UIViewController,  MKMapViewDelegate, CLLocationManagerDelegate {
    

    @IBOutlet weak var Mapa: MKMapView!
        let locationManager = CLLocationManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        Mapa.delegate = self
        
        
        
        
        self.locationManager.delegate = self
        
        self.locationManager.requestWhenInUseAuthorization()
        
        self.locationManager.startUpdatingLocation()
        
        self.Mapa.showsUserLocation = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        var location = CLLocationCoordinate2DMake(22.2163108, -97.8596762)
        
        let loc = locations.last
        
        let center = CLLocationCoordinate2D(latitude: loc!.coordinate.latitude, longitude: loc!.coordinate.longitude)
        
        let region = MKCoordinateRegionMake(center, MKCoordinateSpanMake(0.02, 0.02))
        
        //Mapa.setRegion(region, animated: true)
        
        let sPlacemark = MKPlacemark(coordinate: center, addressDictionary: nil)
        let dPlacemark = MKPlacemark(coordinate: location, addressDictionary: nil)
        
        let sMapItem = MKMapItem(placemark: sPlacemark)
        let dMapItem = MKMapItem(placemark: dPlacemark)
        
        var ann = MKPointAnnotation()
        ann.coordinate = CLLocationCoordinate2DMake(22.2300079, -97.864369)
        ann.title = "Laguna del Carpintero"
        ann.subtitle = "Laguna"
        Mapa.addAnnotation(ann)
        
        var ann1 = MKPointAnnotation()
        ann.coordinate = CLLocationCoordinate2DMake(22.2163108, -97.8596762)
        ann.title = "Catedral de Tampico"
        ann.subtitle = "Iglesia"
        Mapa.addAnnotation(ann1)
        
        var ann2 = MKPointAnnotation()
        ann.coordinate = CLLocationCoordinate2DMake(22.2160132, -97.860481)
        ann.title = "Palacio Municipal"
        ann.subtitle = "Biblioteca"
        Mapa.addAnnotation(ann2)
        
        var ann3 = MKPointAnnotation()
        ann.coordinate = CLLocationCoordinate2DMake(22.213433, -97.859092)
        ann.title = "Plaza de la Libertad"
        ann.subtitle = "Parque"
        Mapa.addAnnotation(ann3)
        
        let directionRequest = MKDirectionsRequest()
        directionRequest.source = sMapItem
        directionRequest.destination = dMapItem
        directionRequest.transportType = .Any
        
        let directions = MKDirections(request: directionRequest)
        
        
        
        directions.calculateDirectionsWithCompletionHandler {
            (response, error) -> Void in
            
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                
                return
            }
            
            let route = response.routes[0]
            self.Mapa.addOverlay((route.polyline), level: MKOverlayLevel.AboveRoads)
            
        }
        
        
    }
    
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Errors" + error.localizedDescription)
    }
    
    
    
    @IBAction func segmentControlChanged(sender: AnyObject) {
        switch sender.selectedSegmentIndex{
        case 1:
            Mapa.mapType = MKMapType.SatelliteFlyover
            
        default:
            Mapa.mapType = MKMapType.Standard
    }
    }
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.greenColor()
        renderer.lineWidth = 1.0
        
        return renderer
    }
    
    
    
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}