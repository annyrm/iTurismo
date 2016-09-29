//
//  PlacesController.swift
//  appTampico
//
//  Created by ITESM CAMPUS TAMPICO on 28/09/16.
//  Copyright © 2016 ITESM CAMPUS TAMPICO. All rights reserved.
//

/*import UIKit

class PlacesController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var ListaSitios: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func get_data_from_url(url:String)
    {
        let urls = "https://semana-i-app.herokuapp.com/api3"
        //Casteamos la cadena de string al tipo NSURL para que pueda ser leida por NSData
        let url = NSURL(string: urls)
        //Obtenemos el contenido de la consulta JSON y lo almacenamos en datos (tipo NSData)
        let datos = NSData(contentsOfURL: url!)
        
        do{
            let json = try NSJSONSerialization.JSONObjectWithData(datos!, options: NSJSONReadingOptions.MutableLeaves)
            let dico1 = json as! NSDictionary
            
            
        }
        catch{
            print("Error")
        }
        
    }

    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dico1.count
    }
    
    /*override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let mapCell = tableView.dequeueReusableCellWithIdentifier("mapCell", forIndexPath: indexPath) as! MapCellController
    mapCell.mapNombre.text = TableData[indexPath.row]
    return mapCell
    }*/
    
    
    
    /*override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let mapCell = tableView.dequeueReusableCellWithIdentifier("mapCell", forIndexPath: indexPath) as! MapCellController
    mapCell.mapNombre.text = TableData[indexPath.row]
    return mapCell
    }*/
    
    
        
    }*/


    



        

    

