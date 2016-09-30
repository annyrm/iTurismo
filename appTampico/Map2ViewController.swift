//
//  Map2ViewController.swift
//  appTampico
//
//  Created by ITESM CAMPUS TAMPICO on 30/09/16.
//  Copyright © 2016 ITESM CAMPUS TAMPICO. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class Map2ViewController: UIViewController,  MKMapViewDelegate, CLLocationManagerDelegate  {

    @IBOutlet var Mapa: MKMapView!
    let locationManager = CLLocationManager()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var location = [[22.2300079, -97.864369],[22.2163108, -97.8596762],[22.213433, -97.859092],[22.2160132, -97.860481],[22.2788721, -97.815527],[22.2658541, -97.783245],[22.2222909, -97.866400],[22.2280361, -97.839443],[22.280432,-97.826848],[22.4952285, -97.8542265]]
        var lat = [22.2300079, 22.2163108, 22.213433, 22.2160132, 22.2788721, 22.2658541, 22.2222909, 22.2280361, 22.280432, 22.4952285]
        var lon = [-97.864369, -97.8596762, -97.859092, -97.860481, -97.815527, -97.783245, -97.866400, -97.839443, -97.826848, -97.8542265]
        var nombre = ["Laguna del Carpintero","Catedral de Tampico","Plaza de la Libertad","Palacio Municipal","Playa Miramar", "Escolleras", "Casa de la Cultura", "Puente Tampico", "Parque Bicentenario", "Playa Tesoro"]
        
        var direccion = ["Boulevard Perimetral","ZONA CENTRO","ZONA CENTRO","ZONA CENTRO","Cd. Madero","Cd. Madero","Lauro Aguirre 105, Melchor Ocampo, 89270 Tampico, Tamps.","Tampico","Cd. Madero","Altamira"]
        
        var descripcion = ["Laguna del Carpintero, un ecosistema de gran importancia en la ciudad de Tampico. A pesar de la presencia del ser humano, muchos cocodrilos siguen habitando el entorno; razón por la que se recomienda no nadar dentro del estanque.","Iglesia Monumental de Tampico","Uno de los sitios mas emblematicos del Centro Histórico de Tampico","Palacio Municipal de Tampico","Miramar nombrada en 2010 la primera playa certificada del Golfo de México en materia de sustentabilidad de calidad de playa para uso recreativo, es sin duda el destino turístico más importante del estado de Tamaulipas.","En la parte sur de Miramar se encuentra el Malecón, también conocido como Las Escolleras, una franja carretera de 1,400 metros construida en 1845, que delimita la unión del Río Pánuco con el Golfo de México. Le recomendamos visitar este lugar desde el cual podrás con suerte admirar delfines y toninas así como la salida y entrada de barcos a puerto.","A tan solo una cuadra de la Avenida Hidalgo, a un costado del Auditorio Municipal, está la Casa de la Cultura, un antiguo edificio construido en 1923 para ser ocupado por el rastro municipal. Aquí se aloja el Archivo Histórico de Tampico además de contar con salones en los cuales constantemente se realizan exhibiciones artísticas y conferencias.","Puente Tampico, una obra maestra de tecnología reflejo de la ingeniería mexicana proyecto que ganó en 1988 el Premio Internacional Puente de Alcántara.","El Parque Bicentenario de Cd. Madero es considerado un complejo recreativo se encuentra ubicado en la Avenida Rodolfo Torre Cantú en el corredor turístico a Playa Miramar. En sus 7 hectáreas cuenta con áreas verdes, ciclo pista, lago artificial y juegos infantiles además de un aviario y una bandera monumental de 75 metros de alto, consi- derada la tercera más alta del país.","Amaneceres; cual musas motivan a la ilusión y esperanza de almas solitarias con explosiones de tornasoles y solferinos de cromos indescriptibles en playa Tesoro de la ciudad y puerto industrial de Altamira Tamaulipas México"]
        
        
        for i in 0...9
        {
            let point = MKPointAnnotation()
            point.coordinate = CLLocationCoordinate2DMake(lat[i], lon[i])
            point.title = nombre[i]
            point.subtitle = direccion[i]
            
            
            
            self.Mapa.addAnnotation(point)
        }
        

        self.Mapa.delegate = self
        
        
        
        self.locationManager.delegate = self
        
        self.locationManager.requestWhenInUseAuthorization()
        
        self.locationManager.startUpdatingLocation()
        
        self.Mapa.showsUserLocation = true
        

        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        let loc = locations.last
        
        let center = CLLocationCoordinate2D(latitude: loc!.coordinate.latitude, longitude: loc!.coordinate.longitude)
        
        let region = MKCoordinateRegionMake(center, MKCoordinateSpanMake(0.02, 0.02))
        
        //Mapa.setRegion(region, animated: true)
        
        var location = CLLocationCoordinate2DMake(
            22.2163108,
            -97.8596762)
        let sPlacemark = MKPlacemark(coordinate: location, addressDictionary: nil)
        let dPlacemark = MKPlacemark(coordinate: center, addressDictionary: nil)
        
        let sMapItem = MKMapItem(placemark: sPlacemark)
        let dMapItem = MKMapItem(placemark: dPlacemark)
        
        
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

