import Foundation

public struct StocksAPI {
    private let session = URLSession.shared
    private let jsonDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return decoder
    }()

    private let baseURL = "https://query1.finance.yahoo.com"

    public func fetchChart(symbol: String, range: ChartRange) async throws -> Chart {
        guard var urlComponents = URLComponents(string: "\(baseURL)/v8/finance/chart/\(symbol)") else {
            throw APIError.invalidURL
        }
        print(range.rawValue)
        urlComponents.queryItems = [
            .init(name: "range", value: range.rawValue),
            .init(name: "interval", value: range.interval),
            .init(name: "indicators", value: "quote"),
            .init(name: "includeTimestamp", value: "true")
        ]
        guard let url = urlComponents.url else {
            throw APIError.invalidURL
        }
        print(url)

        
        let (response, statusCode): (ChartResponse, Int) = try await fetch(url: url)
        if let error = response.error {
            throw APIError.httpStatusCodeFailed(statusCode: statusCode, error: error)
        }
        
        return response.data
    }
    
    public func searchQuotes(query: String, isEquityTypeOnly: Bool = true) async throws -> [Quotes] {
        guard var urlComponents = URLComponents(string: "\(baseURL)/v1/finance/search") else {
            throw APIError.invalidURL
        }
        urlComponents.queryItems = [
            .init(name: "q", value: query),
            .init(name: "quotesCount", value: "20"),
            .init(name: "lang", value: "en-US")
        ]
        guard let url = urlComponents.url else {
            throw APIError.invalidURL
        }
        let (response, statusCode): (QuotesResponse, Int) = try await fetch(url: url)
        if let error = response.error {
            throw APIError.httpStatusCodeFailed(statusCode: statusCode, error: error)
        }
        if isEquityTypeOnly {
            return (response.data ?? [])
            .filter { ($0.quoteType ?? "").localizedCaseInsensitiveCompare("equity") == .orderedSame }
        } else {
            return response.data ?? []
        }
    }
    
    private func fetch<C: Codable>(url: URL) async throws -> (C, Int) {
        let (data, response) = try await session.data(from: url)
        
        do {
            let statusCode = try validateHTTPResponseCode(response)
            let decodedData = try jsonDecoder.decode(C.self, from: data)
            return (decodedData, statusCode)
        } catch let decodingError {
            print("Decoding error: \(decodingError)")
            throw decodingError
        }
    }
    
    private func validateHTTPResponseCode(_ response: URLResponse) throws -> Int {
        guard let httpsResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponseType
        }
        guard 200...299 ~= httpsResponse.statusCode || 400...499 ~= httpsResponse.statusCode
        else {
            throw APIError.httpStatusCodeFailed(statusCode: httpsResponse.statusCode, error: nil)
        }
        return httpsResponse.statusCode
    }
    
    public init() { }
}
