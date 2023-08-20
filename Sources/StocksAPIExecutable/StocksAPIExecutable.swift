//
//  File.swift
//  
//
//  Created by Amit Azulay on 20/08/2023.
//

import Foundation
import StocksAPI

@main
struct StocksAPIExecutable {
    static let stockAPI = StocksAPI()

    static func main() async {
        do {
            let chart = try await stockAPI.fetchChart(symbol: "AAPL", range: .y10)
//            let quotes = try await stockAPI.searchQuotes(query: "tesla")
            print(chart) 
        } catch {
            print(error.localizedDescription)
        }
    }
}
