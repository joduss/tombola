//
//  PriceList.swift
//  Tombola
//
//  Created by Jonathan Duss on 08.08.17.
//  Copyright © 2017 Jo. All rights reserved.
//

import Foundation


class PricesManager {
    
    private static let PriceListStorageKey = "prices"
    
    private(set) var prices: [String: Int] = [:]
    
    init() {
        if let loadedPrices = UserDefaults.standard.dictionary(forKey: PricesManager.PriceListStorageKey) as? [String: Int] {
            self.prices = loadedPrices
        }
    }
    
    func save() {
        UserDefaults.standard.set(prices, forKey: PricesManager.PriceListStorageKey)
    }
    
    func decrement(forPrice price: String) {
        let newCount = prices[price]! - 1
        prices[price] = newCount
        save()
    }
    
    ///Returns the prices that are still available
    var availablePrices: [String] {
        get {
            let pricesNonZero = prices.filter({ pair in
                return pair.value > 0
            })
            return pricesNonZero.map({$0.key})
        }
    }
    
    
}
