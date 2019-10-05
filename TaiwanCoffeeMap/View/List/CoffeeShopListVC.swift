//
//  CoffeeShopListVC.swift
//  TaiwanCoffeeMap
//
//  Created by Jack on 2019/10/4.
//  Copyright © 2019 Jack. All rights reserved.
//

import UIKit

class CoffeeShopListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        }
    }
    
    var viewModel: CoffeeShopViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension CoffeeShopListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else {
            return 0
        }
        
        return viewModel.numberOfShops
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = viewModel.viewModel(for: indexPath.row).name
        
        return cell
    }
}