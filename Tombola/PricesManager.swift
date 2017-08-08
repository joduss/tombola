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
        if let loadedPrices = UserDefaults.standard.dictionary(forKey: PriceManager.PriceListStorageKey) as? [String: Int] {
            self.prices = loadedPrices
        }
    }
    
    func save() {
        UserDefaults.standard.set(prices, forKey: PriceManager.PriceListStorageKey)
    }
    
    
    
    
}
