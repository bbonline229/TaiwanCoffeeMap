//
//  CoffeeShopListCell.swift
//  TaiwanCoffeeMap
//
//  Created by Jack on 2019/10/6.
//  Copyright © 2019 Jack. All rights reserved.
//

import UIKit
import MapKit

class CoffeeShopListCell: UITableViewCell {
    
    @IBOutlet weak var shopNameLabel: UILabel!
    @IBOutlet weak var shopAddressLabel: UILabel!
    @IBOutlet weak var navigateImageView: UIImageView! {
        didSet {
            let tap = UITapGestureRecognizer(target: self, action: #selector(navigate))
            navigateImageView.isUserInteractionEnabled = true
            navigateImageView.addGestureRecognizer(tap)
        }
    }
    
    var viewModel: CoffeeShopInfoViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            
            shopNameLabel.text = viewModel.name
            shopAddressLabel.text = viewModel.address
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func navigate(sender: UITapGestureRecognizer) {
        guard let viewModel = viewModel else { return }
        
        let lat = viewModel.latitude
        let lng = viewModel.longitude
        
        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        let placeMark = MKPlacemark(coordinate: coordinate, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placeMark)
        mapItem.name = viewModel.name
        mapItem.openInMaps(launchOptions: nil)
    }
}
