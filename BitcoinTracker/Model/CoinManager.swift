//
//  CoinManager.swift
//  BitcoinTracker
//
//  Created by Nick Krasnitskiy on 16.03.2021.
//

import Foundation


struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "3F42D296-4FB8-4380-A59D-350A61764A7F"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        
        // 1. Create a URL
        if let url = URL(string: urlString) {
            
            // 2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            
            // 3. Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    if let safeDataString = String(data: safeData, encoding: .utf8) {
                        print(safeDataString)
                    }
                }
            }
            
            // 4. Start the task
            task.resume()
    
        }
    }
}
