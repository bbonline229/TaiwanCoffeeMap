//
//  CoffeeShopViewModelTest.swift
//  TaiwanCoffeeMapTests
//
//  Created by Jack on 2019/10/11.
//  Copyright © 2019 Jack. All rights reserved.
//

import XCTest
@testable import TaiwanCoffeeMap

class CoffeeShopViewModelTest: XCTestCase {
    
    var sut: CoffeeShopViewModel!
    
    let searchText = "The"

    override func setUp() {
        super.setUp()
        
        let data = loadStubFromBundle(withName: "coffeeShop", extension: "json")
        let coffeeData = try! JSONDecoder().decode([CoffeeShopInfo].self, from: data)
        
        sut = CoffeeShopViewModel(coffeeShops: coffeeData)
    }

    override func tearDown() {
        super.tearDown()
        
        sut = nil
    }

    func test_NumberOfShops_NotSearch() {
        XCTAssertEqual(sut.numberOfShops, sut.coffeeShops.count)
    }
    
    func test_NumberOfShops_WhenSearching() {
        sut.filterCoffeeShop(with: searchText)
        
        XCTAssertEqual(sut.numberOfShops, sut.searchCoffeeShops.count)
    }
    
    func test_CheckShopInfo_NotSearch() {
        let index = 0
        let shopInfoVM = sut.viewModel(for: index)
        
        XCTAssertEqual(shopInfoVM.coffeeShopInfo, sut.coffeeShops[index].coffeeShopInfo)
    }
    
    func test_CheckShopInfo_WhenSearching() {
        let index = 0
        sut.filterCoffeeShop(with: searchText)
        let shopInfoVM = sut.viewModel(for: index)
        
        XCTAssertEqual(shopInfoVM.coffeeShopInfo, sut.searchCoffeeShops[index].coffeeShopInfo)
    }
    
    func test_CheckStatus_NotSearch() {
       XCTAssertEqual(sut.isSearch, false)
    }
    
    func test_CheckStatus_WhenSearching() {
        sut.filterCoffeeShop(with: searchText)
        
        XCTAssertEqual(sut.isSearch, true)
    }
    
    func test_CheckStatus_WhenCancelSearch() {
        sut.cancelSearch()
        
        XCTAssertEqual(sut.isSearch, false)
    }
}
