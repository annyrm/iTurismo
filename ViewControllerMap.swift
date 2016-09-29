//
//  ViewControllerMap.swift
//  appTampico
//
//  Created by ITESM CAMPUS TAMPICO on 29/09/16.
//  Copyright © 2016 ITESM CAMPUS TAMPICO. All rights reserved.
//

import UIKit

class ViewControllerMap: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var listaSitios: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sitios.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let mapCell = tableView.dequeueReusableCellWithIdentifier("mapCell", forIndexPath: indexPath) as! MapCellController
        let row = indexPath.row
        
        mapCell.menuOption.text = sitios[row]["name"]
        mapCell.menuImage?.image = UIImage(named:sitios[row]["imageName"]!)
        
        return cell
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
