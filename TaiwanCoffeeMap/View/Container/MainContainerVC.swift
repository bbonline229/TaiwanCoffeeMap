//
//  MainContainerVC.swift
//  TaiwanCoffeeMap
//
//  Created by Jack on 2019/10/4.
//  Copyright © 2019 Jack. All rights reserved.
//

import UIKit

class MainContainerVC: UIViewController {
    
    enum ContentType: String {
        case map = "Map"
        case list = "List"
        
        var switchContent: ContentType {
            switch self {
            case .map:
                return .list
            case .list:
                return .map
            }
        }
        
        var barButtonTitle: String {
            return switchContent.rawValue
        }
    }
    
    private lazy var coffeeShopMapVC: UIViewController = {
        let vc = CoffeeShopMapVC()
        vc.viewModel = viewModel
        return vc
    }()
    
    private lazy var coffeeShopListVC: UIViewController = {
        let vc = CoffeeShopListVC()
        vc.viewModel = viewModel
        return vc
    }()
    
    private var currentVC: UIViewController?
    
    private var viewModel: CoffeeShopViewModel?
    
    private var barButton: UIBarButtonItem!
    
    private let networkService = NetWorkService()
    
    private var contentType: ContentType = .map
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
        fetchCoffeeShopData()
    }
    
    private func setupNavigation() {
        navigationItem.title = "台灣咖啡地圖"
        
        barButton = UIBarButtonItem(title: contentType.barButtonTitle, style: .plain, target: self, action: #selector(switchStyle))
        navigationItem.rightBarButtonItem = barButton
    }
    
    private func fetchCoffeeShopData() {
        guard let url = URL(string: API.baseURL) else { return }
        
        let resorce = Resource<[CoffeeShopInfo]>(url: url)
        
        networkService.load(resource: resorce) { [weak self] (coffeeShops) in
            guard let coffeShops = coffeeShops else { return }
            
            self?.viewModel = CoffeeShopViewModel(coffeeShops: coffeShops)
            
            self?.disPlayContentView(with: .map)
        }
    }
    
    @objc private func switchStyle() {
        removeCurrentVC()
        
        contentType = contentType.switchContent
        disPlayContentView(with: contentType)
        barButton.title = contentType.barButtonTitle
    }
    
    private func disPlayContentView(with contentType: ContentType) {
        let vc = getDisPlayVC(with: contentType)
        
        vc.didMove(toParent: self)
        vc.view.frame = view.frame
        
        view.addSubview(vc.view)
        addChild(vc)
        currentVC = vc
    }
    
    private func getDisPlayVC(with contentType: ContentType) -> UIViewController {
        var vc: UIViewController
        
        switch contentType {
        case .map:
            vc = coffeeShopMapVC
        case .list:
            vc = coffeeShopListVC
        }
        
        return vc
    }
    
    private func removeCurrentVC() {
        currentVC?.view.removeFromSuperview()
        currentVC?.removeFromParent()
    }
}
