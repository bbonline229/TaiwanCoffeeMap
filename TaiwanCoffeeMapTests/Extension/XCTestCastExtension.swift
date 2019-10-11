//
//  XCTestCastExtension.swift
//  TaiwanCoffeeMapTests
//
//  Created by Jack on 2019/10/11.
//  Copyright © 2019 Jack. All rights reserved.
//

import XCTest

extension XCTestCase {
    func loadStubFromBundle(withName name: String, extension: String) -> Data {
        let bundle = Bundle(for: classForCoder)
        let url = bundle.url(forResource: name, withExtension: `extension`)
        
        return try! Data(contentsOf: url!)
    }
}
