//
//  CoffeeStoreInfo.swift
//  TaiwanCoffeeMap
//
//  Created by Jack on 2019/10/3.
//  Copyright © 2019 Jack. All rights reserved.
//

import Foundation

struct CoffeeShopInfo: Decodable {
    let name: String
    let city: String
    let wifi: Double
    let seat: Double
    let quiet: Double
    let tasty: Double
    let cheap: Double
    let music: Double
    let url: String
    let address: String
    let latitude: String
    let longitude: String
    let mrtStation: String
    let openTime: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case city
        case wifi
        case seat
        case quiet
        case tasty
        case cheap
        case music
        case url
        case address
        case latitude
        case longitude
        case mrtStation = "mrt"
        case openTime = "open_time"
    }
}
