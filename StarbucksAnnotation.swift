
import MapKit

class StarbucksAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var direccion: String!
    var nombre: String!
    var descripcion: String!
    var eta: String?
    //var image: UIImage!
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
