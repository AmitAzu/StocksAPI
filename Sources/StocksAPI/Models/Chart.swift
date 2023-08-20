//
//  File.swift
//  
//
//  Created by Amit Azulay on 20/08/2023.
//

import Foundation

public struct ChartResponse: Codable {
    public let data: Chart
    public let error: ErrorResponse?
    
    public enum CodingKeys: String, CodingKey {
        case data = "chart"
        case error = "error"
    }
}

public struct Chart: Codable {
    public let results: [Result]?
    
    public enum CodingKeys: String, CodingKey {
        case results = "result"
    }
}

public struct Result: Codable {
    public let meta: Meta?
    public let timeStamp: [Int]?
    public let indicators: Indicators?
}

public struct Indicators: Codable {
    public let quote: [Quote]?
}

public struct Quote: Codable {
    public let open, high, low, close: [Double?]
    public let volume: [Int?]
}

public struct Meta: Codable {
    public let currency, symbol, exchangeName, instrumentType, timezone, exchangeTimezoneName, range, dataGranularity: String?
    public let firstTradeDate, regularMarketTime, gmtoffset, previousClose, scale, priceHint: Int?
    public let regularMarketPrice, chartPreviousClose: Double?
    public let validRanges: [String]?
    public let currentTradingPeriod: CurrentTradingPeriod?
}

public struct CurrentTradingPeriod: Codable {
    public let pre: Pre
    public let regular: Pre
    public let post: Pre
}

public struct Pre: Codable {
    public let timezone: String?
    public let start, end, gmtoffset: Int?
}

