//
//  TableViewController.swift
//  Acoounts_For_ING
//
//  Created by sabina on 21/01/17.
//  Copyright © 2017 sabina. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UIViewController,UITableViewDataSource {
    
    var accounts = [Account]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountTableViewCell", for: indexPath) as! AccountTableViewCell
    
        
        let account = self.accounts[indexPath.row]
        
        cell.account = account
    
        return cell
    }
    
    
    
}
