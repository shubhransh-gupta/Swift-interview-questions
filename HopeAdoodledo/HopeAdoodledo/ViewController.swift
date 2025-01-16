//
//  ViewController.swift
//  HopeAdoodledo
//
//  Created by Shubhransh Gupta on 15/01/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var tableView: UITableView!
    private var viewModel: ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(DetailsTVS.self, forCellReuseIdentifier: "DetailsTVS")
        // Do any additional setup after loading the view.
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTVS", for: indexPath) as? DetailsTVS {
            viewModel = ViewModel(delegate: cell, networkManager: NetworkManager.shared)
            if indexPath.section == 0 {
                viewModel?.callUserAPIForCorrespondingIndex(index: indexPath.row + 1)
            } else {
                viewModel?.callDriverAPIForCorrespondingIndex(index: indexPath.row + 1)
            }
            return cell
        }
        return UITableViewCell()
    }
}
