//
//  CoffeeShopViewModel.swift
//  TaiwanCoffeeMap
//
//  Created by Jack on 2019/10/3.
//  Copyright © 2019 Jack. All rights reserved.
//

import UIKit

class CoffeeShopInfoViewModel {
    let coffeeShopInfo: CoffeeShopInfo
    
    init(coffeeShopInfo: CoffeeShopInfo) {
        self.coffeeShopInfo = coffeeShopInfo
    }
}

extension CoffeeShopInfoViewModel {
    var name: String {
        return coffeeShopInfo.name
    }
    
    var address: String {
        return coffeeShopInfo.address
    }
    
    var website: String {
        return coffeeShopInfo.website
    }
    
    var websiteAttributedString: NSAttributedString {
        var attribute: [NSAttributedString.Key: Any]
        
        if coffeeShopInfo.website.isEmpty {
            attribute = [
                NSAttributedString.Key.foregroundColor: UIColor.black
            ]
        } else {
            attribute = [
                NSAttributedString.Key.foregroundColor: UIColor.cerulean,
                NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
            ]
        }
        let websiteText = coffeeShopInfo.website.isEmpty ? "暫無資訊" : "官方網站"
        
        return NSAttributedString(string: websiteText, attributes: attribute)
    }
    
    var openTime: String {
        return coffeeShopInfo.openTime.isEmpty ? "暫無資訊" : coffeeShopInfo.openTime
    }
    
    var latitude: Double {
        return Double(coffeeShopInfo.latitude)!
    }
    
    var longitude: Double {
        return Double(coffeeShopInfo.longitude)!
    }
    
    var wifi: String {
        return starImageName(with: coffeeShopInfo.wifi)
    }
    
    var cheap: String {
        return starImageName(with: coffeeShopInfo.cheap)
    }
    
    var seat: String {
        return starImageName(with: coffeeShopInfo.seat)
    }
    
    var quiet: String {
        return starImageName(with: coffeeShopInfo.quiet)
    }
    
    var music: String {
        return starImageName(with: coffeeShopInfo.music)
    }
    
    var tasty: String {
        return starImageName(with: coffeeShopInfo.tasty)
    }
    
    private func starImageName(with score: Double) -> String {
        switch score {
        case 1..<1.5:
            return "stars_1"
        case 1.5..<2:
            return "stars_1_5"
        case 2..<2.5:
            return "stars_2"
        case 2.5..<3:
            return "stars_2_5"
        case 3..<3.5:
            return "stars_3"
        case 3.5..<4:
            return "stars_3_5"
        case 4..<4.5:
            return "stars_4"
        case 4.5...5:
            return "stars_4_5"
        default:
            return "stars_5"
        }
    }
}
