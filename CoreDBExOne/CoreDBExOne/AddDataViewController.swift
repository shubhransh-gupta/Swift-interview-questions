//
//  AddDataViewController.swift
//  CoreDBExOne
//
//  Created by Shubhransh Gupta on 15/08/23.
//

import UIKit

class AddDataViewController: UITableViewController {
    var home : [String] = []
    var name : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getValue()
        // Do any additional setup after loading the view.
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = name[indexPath.row]
        cell.detailTextLabel?.text = home[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }

    func getValue() {
        let managedObject = CoreDBHandler.shared.fetchEmployee()!
        for i in managedObject {
            self.home.append(i.address!)
            self.name.append(i.name!)
        }
        print(managedObject.count)
    }
    
    @IBAction func click(_ sender: UIBarButtonItem) {
        
       
    }
}
