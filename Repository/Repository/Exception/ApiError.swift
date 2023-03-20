//
//  ApiError.swift
//  Repository
//
//

import Foundation

public enum ApiError: Error {
    case unknown
    case unauthorized
    case badURL
    case badResponse(statusCode: Int)
    case url(URLError?)
    case parsing(DecodingError?)
    
    var localizedDescription: String {
        // user feedback
        switch self {
        case .badURL, .parsing, .unknown:
            return "Sorry, something went wrong."
        case .badResponse(_):
            return "Sorry, the connection to our server failed."
        case .url(let error):
            return error?.localizedDescription ?? "Something went wrong."
        case .unauthorized:
            return "unauthorized"
        }
    }
    
    var description: String {
        //info for debugging
        switch self {
        case .unknown: return "unknown error"
        case .badURL: return "invalid URL"
        case .url(let error):
            return error?.localizedDescription ?? "url session error"
        case .parsing(let error):
            return "parsing error \(String(describing: error))"
        case .badResponse(statusCode: let statusCode):
            return "bad response with status code \(statusCode)"
        case .unauthorized:
            return "unauthorized"
        }
    }
}

public enum UnauthorizedError: Error {
    case tokenExpired
}
