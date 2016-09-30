//
//  ViewController.swift
//  appTampico
//
//  Created by ITESM CAMPUS TAMPICO on 28/09/16.
//  Copyright © 2016 ITESM CAMPUS TAMPICO. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{


    @IBOutlet weak var mainMenu: UITableView!
    
    var menu = [Dictionary<String,String>()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Se asigna este controlador como delegado de la tabla del menú principal
        mainMenu.delegate = self
        mainMenu.dataSource = self
    }
    
    override func viewWillAppear(animated: Bool) {
        if (menu.count != 0) {
            menu.removeAll()
            // Elementos del menú principal
            menu.append(["name":"Rutas","imageName":"maps.png","segue":"mapSegue"])
            menu.append(["name":"Lector de códigos QR","imageName":"qr.png","segue":"qrSegue"])
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITableViewDataSourceMethods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MenuCellController
        let row = indexPath.row
        
        cell.menuOption.text = menu[row]["name"]
        cell.menuImage?.image = UIImage(named:menu[row]["imageName"]!)
        
        return cell
    }
    
    // MARK: UITableViewDelegate Methods
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //Dependiendo del renglón que elija, es la ruta que seguirá
        
        let row = indexPath.row
        let chosenSegue = menu[row]["segue"]

        performSegueWithIdentifier(chosenSegue!, sender: self)
        
    }
    
    @IBAction func shareToFacebook(){
        var shareToFacebook : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        self.presentViewController(shareToFacebook, animated: true, completion: nil)
    }
    
    @IBAction func shareToTwitter(){
        var shareToTwitter : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        self.presentViewController(shareToTwitter, animated: true, completion: nil)
    }

    

}

