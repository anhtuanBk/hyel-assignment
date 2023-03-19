//
//  ApiError.swift
//  Repository
//
//

import Foundation

public enum ApiError: Error {
    case unknown
    case unauthorized
}

public enum UnauthorizedError: Error {
    case tokenExpired
}
