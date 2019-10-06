//
//  CoffeeShopListVC.swift
//  TaiwanCoffeeMap
//
//  Created by Jack on 2019/10/4.
//  Copyright © 2019 Jack. All rights reserved.
//

import UIKit

class CoffeeShopListVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            searchBar.delegate = self
        }
    }
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(UINib(nibName: "CoffeeShopListCell", bundle: nil), forCellReuseIdentifier: "cell")
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CoffeeShopListCell
        
        cell.viewModel = viewModel.viewModel(for: indexPath.row)
        
        return cell
    }
}

extension CoffeeShopListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchBarReset()
    }
}

extension CoffeeShopListVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let viewModel = viewModel else { return }
        
        viewModel.filterCoffeeShop(with: searchText)
        
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        guard let viewModel = viewModel else { return }
        
        viewModel.cancelSearch()
        searchBarReset()
        
        tableView.reloadData()
    }
    
    private func searchBarReset() {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
}
