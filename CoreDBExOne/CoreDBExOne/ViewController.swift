//
//  ViewController.swift
//  CoreDBExOne
//
//  Created by Shubhransh Gupta on 15/08/23.
//

import UIKit

class ViewController: UIViewController {
    var home : [String] = []
    var name : [String] = []
    @IBOutlet weak var d2: UILabel!
    @IBOutlet weak var d1: UILabel!
    var IndexO = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CRUD Ops"
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setEmployees()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute : { [weak self] in
            self?.getValue()
        })
        // Do any additional setup after loading the view.
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute : { [weak self] in
//            self?.setTheVC()
//        })
        self.setTheVC()
    }
    
    @IBAction func displaynextdata(_ sender: Any) {
        IndexO += 1
        if IndexO < name.count && IndexO < home.count {
            d1.text = home[IndexO]
            d2.text = name[IndexO]
        }
        let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "AddDataViewController")
//        self.navigationController?.viewControllers.append(vc)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setTheVC() {
        d1.text = home.first ?? "null"
        d2.text = name.first ?? "null"
    }
    
    func setEmployees() {
        let name = ["Raja", "Rani", "Praja"]
        let home = ["dholakpur", "nainital", "chimau"]
        DispatchQueue.main.async {
            CoreDBHandler.shared.setEmployee(nameA: name, homeA: home)
        }
    }
    
    func getValue() {
        let managedObject = CoreDBHandler.shared.fetchEmployee()!
        for i in managedObject {
            self.home.append(i.value(forKey: "home") as! String)
            self.name.append(i.value(forKey: "name") as! String)
        }
        
    }
    
    @IBAction func spamupdate(_ sender: Any) {
        DispatchQueue.main.async {
            CoreDBHandler.shared.updateData(nameToSet: "Shubhransh", nameToUpdate: "Rani")
        }
    }
    
    @IBAction func deleteRecord(_ sender: Any) {
        DispatchQueue.main.async {
            CoreDBHandler.shared.deleteData(employeeToDelete: "Shubhransh")
        }
    }
    
}

