//
//  File.swift
//  
//
//  Created by Amit Azulay on 20/08/2023.
//

import Foundation

public enum APIError: Error {
    case invalidURL
    case invalidResponseType
    case httpStatusCodeFailed(statusCode: Int, error: ErrorResponse?)
    
    public static var errorDomain: String {
        "StockAPI"
    }
    
    public var errorCode: Int {
        switch self {
        case .invalidURL: return 0
        case .invalidResponseType: return 1
        case .httpStatusCodeFailed: return 2
        }
    }
    
    public var errorUserInfo: String {
        let text: String
        switch self {
        case .invalidURL:
            text = "invalid URL"
        case let .httpStatusCodeFailed(statusCode, error):
            if let error = error {
                text = "Error: statusCode: \(statusCode), message: \(error.description)"
            } else {
                text = "Error statusCode: \(statusCode)"
            }
        case .invalidResponseType:
            text = "invalid response type"
        }
        return text
    }
}
