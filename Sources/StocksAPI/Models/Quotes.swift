//
//  File.swift
//  
//
//  Created by Amit Azulay on 20/08/2023.
//

import Foundation

public struct QuotesResponse: Codable {
    public let data: [Quotes]?
    public let error: ErrorResponse?
    
    public enum CodingKeys: String, CodingKey {
        case data = "quotes"
        case error = "error"
    }
}

public struct Quotes: Codable {
    public let exchange, shortName, quoteType, symbol, index, typeDisplay, longName,
               exchangeDisplay, sector, sectorDisplay, industry, industryDisplay: String?
    public let score: Int?
    
    public enum CodingKeys: String, CodingKey {
        case shortName = "shortname"
        case longName = "longname"
        case exchange = "exchange"
        case quoteType = "quoteType"
        case symbol = "symbol"
        case index = "index"
        case typeDisplay = "typeDisp"
        case exchangeDisplay = "exchDisp"
        case sector = "sector"
        case sectorDisplay = "sectorDisp"
        case industry = "industry"
        case industryDisplay = "industryDisp"
        case score = "score"
    }
}
