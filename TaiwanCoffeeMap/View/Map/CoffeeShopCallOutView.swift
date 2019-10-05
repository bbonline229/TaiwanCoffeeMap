//
//  CoffeeShopInfoView.swift
//  TaiwanCoffeeMap
//
//  Created by Jack on 2019/10/3.
//  Copyright © 2019 Jack. All rights reserved.
//

import UIKit
import MapKit

class CoffeeShopCallOutView: UIView {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var openTimeLabel: UILabel!
    
    @IBOutlet weak var wifiImageView: UIImageView!
    @IBOutlet weak var cheapImageView: UIImageView!
    @IBOutlet weak var quietImageView: UIImageView!
    @IBOutlet weak var seatImageView: UIImageView!
    @IBOutlet weak var tastyImageView: UIImageView!
    @IBOutlet weak var musicImageView: UIImageView!
    
    @IBOutlet weak var websiteLabel: UILabel! {
        didSet {
            let tap = UITapGestureRecognizer(target: self, action: #selector(openWebsite))
            websiteLabel.isUserInteractionEnabled = true
            websiteLabel.addGestureRecognizer(tap)
        }
    }
    
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
            
            nameLabel.text = viewModel.name
            addressLabel.text = viewModel.address
            openTimeLabel.text = viewModel.openTime
            websiteLabel.attributedText = viewModel.websiteAttributedString
            
            wifiImageView.image = UIImage(named: viewModel.wifi)
            cheapImageView.image = UIImage(named: viewModel.cheap)
            quietImageView.image = UIImage(named: viewModel.quiet)
            seatImageView.image = UIImage(named: viewModel.seat)
            tastyImageView.image = UIImage(named: viewModel.tasty)
            musicImageView.image = UIImage(named: viewModel.music)
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
    
    @objc func openWebsite(sender: UITapGestureRecognizer) {
        guard let viewModel = viewModel,
            let url = URL(string: viewModel.website) else { return }
        UIApplication.shared.open(url)
    }
}
