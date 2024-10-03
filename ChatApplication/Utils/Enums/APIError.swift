//
//  APIError.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 03/10/24.
//

import Foundation

enum APIError: Error{
    case noDataError
    case randomError(String)
    case urlError
    case jsonEncodingError
    case jsonDecodingError
    case badRequest
    case accessforbidden
    case unauthorized
    
    var desc: String{
        switch self {
        case .noDataError:
            return "No data from the server"
        case .randomError(let error):
            return "Some error: \(error)"
        case .urlError:
            return "Invalid URL"
        case .jsonEncodingError:
            return "Encoding error"
        case .jsonDecodingError:
            return "Decoding error"
        case .badRequest:
            return "Bad Request"
        case .accessforbidden:
            return "User is valid but the access to the data is forbidden"
        case .unauthorized:
            return "Unauthorized access to the data invalid user token"
        @unknown default:
            return "Unknown error"
        }
    }
}
