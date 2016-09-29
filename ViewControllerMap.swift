//
//  ViewControllerMap.swift
//  appTampico
//
//  Created by ITESM CAMPUS TAMPICO on 29/09/16.
//  Copyright © 2016 ITESM CAMPUS TAMPICO. All rights reserved.
//

import UIKit

class ViewControllerMap: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var listaSitios: UITableView!
    

    var dict = [Dictionary<String,String>()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaSitios.delegate = self
        listaSitios.dataSource = self
        get_json()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func get_json () {
        //var sitiosName = ""
        let urls = "https://semana-i-app.herokuapp.com/api3"
        let url = NSURL(string: urls)
        let data = NSData(contentsOfURL: url!)
        
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
            let dictionary = json as? [AnyObject]
            //let sitiosArray = dictionary["nombre"] as! NSArray //Arreglo de autores
            
            for _id in dictionary! {
                print("\(_id)")
            }
           
            
            
        } catch {
            // Handle Error
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        if (dict.count != 0) {
            dict.removeAll()
            // Elementos del menú principal
            dict.append(["name":"Plaza de Armas","Ciudad":"Tampico"])
            dict.append(["name":"Laguna del Carpintero","Ciudad":"Tampico"])
            dict.append(["name":"Playa Miramar","Ciudad":"Madero"])
        }
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dict.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let mapCell = tableView.dequeueReusableCellWithIdentifier("mapCell", forIndexPath: indexPath) as! MapCellController
        let row = indexPath.row
        
        mapCell.mapNombre.text = dict[row]["name"]
        mapCell.mapCiudad.text = dict[row]["ciudad"]
        
        return mapCell
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
