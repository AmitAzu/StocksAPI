//
//  File.swift
//  
//
//  Created by Amit Azulay on 20/08/2023.
//

import Foundation

public struct ErrorResponse: Codable {
    let code: String
    let description: String
    
    init(code: String, description: String) {
        self.code = code
        self.description = description
    }
}
