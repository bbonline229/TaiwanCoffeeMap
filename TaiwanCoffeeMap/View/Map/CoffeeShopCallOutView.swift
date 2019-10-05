//
//  CoffeeShopInfoView.swift
//  TaiwanCoffeeMap
//
//  Created by Jack on 2019/10/3.
//  Copyright © 2019 Jack. All rights reserved.
//

import UIKit

class CoffeeShopCallOutView: UIView {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var mrtStationLabel: UILabel!
    @IBOutlet weak var openTimeLabel: UILabel!
    
    var viewModel: CoffeeShopInfoViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            
            nameLabel.text = viewModel.name
            addressLabel.text = viewModel.address
            mrtStationLabel.text = viewModel.mrtStation
            openTimeLabel.text = viewModel.openTime
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        customizeAwakeFromCoder()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        customizeAwakeFromCoder()
    }
}
