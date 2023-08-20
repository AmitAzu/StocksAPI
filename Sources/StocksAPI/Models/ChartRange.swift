//
//  File.swift
//  
//
//  Created by Amit Azulay on 20/08/2023.
//

import Foundation

public enum ChartRange: String, CaseIterable {
    case d1 = "1d"
    case d5 = "5d"
    case y1 = "1y"
    case y2 = "2y"
    case y5 = "5y"
    case y10 = "10y"
    case ytd = "ytd"
    case mo1 = "1mo"
    case mo3 = "3mo"
    case mo6 = "6mo"
    case max = "max"
    
    public var interval: String {
        switch self {
        case .d1: return "1m"
        case .d5: return "5m"
        case .mo1: return "90m"
        case .mo3, .mo6, .ytd, .y1, .y2: return "1d"
        case .y5, .y10: return "1wk"
        case .max: return "3mo"
        }
    }
}
