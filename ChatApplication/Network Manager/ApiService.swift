//
//  ApiService.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 30/09/24.
//

import Foundation
import Logger

class APIService{
    
    static let shared = APIService()
    let baseUrl = AppConfiguration().apiBaseUrl
    private let userPreferences = UserPreferences()
    
    
    func login(_ requestBody: UserRequest, completion: @escaping (Result<UserData, APIError>) -> Void ){
        
        guard let url = URL(string: "\(baseUrl)\(ApiEndpoints.login.url)") else {
            completion(.failure(.urlError))
            return
        }
        guard let jsonData = try? JSONEncoder().encode(requestBody) else {
            completion(.failure(.jsonEncodingError))
            return
        }
        var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            if let error = error {
                completion(.failure(.randomError(error.localizedDescription)))
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                print("Status Code: \(httpResponse.statusCode)")
            }
            if let data = data {
                do {
                    let _ = String(decoding: data, as: UTF8.self)
//                    print(str)
                    let decodedResponse = try JSONDecoder().decode(AuthResponse.self, from: data)
                    let statusCode = decodedResponse.code
                    
                    switch statusCode{
                    case 200:
                        if let userData = decodedResponse.resources?.data{
                            print(userData.authToken)
                            completion(.success(userData))
                        }else{
                            completion(.failure(.randomError("200 code but still something went wrong")))
                        }
                    case 400:
                        completion(.failure(.badRequest))
                    case 403:
                        completion(.failure(.accessforbidden))
                    case 404:
                        completion(.failure(.unauthorized))
                    default:
                        completion(.failure(.randomError("Something went wrong")))
                    }
                    
                } catch {
                    completion(.failure(.jsonDecodingError))
                }
            }else{
                completion(.failure(.noDataError))
                return
            }
            
        }
        task.resume()
        
    }
    
    
    func fetchGroupList(page:Int? = 1, limit:Int? = 10, search:String? = nil, completion: @escaping (Result<[GroupData], APIError>) -> Void){
        
        // Base URL
        guard var urlComponents = URLComponents(string: "\(baseUrl)\(ApiEndpoints.groupList.url)") else {
            completion(.failure(.urlError))
            return
        }
        
        // Add optional query parameters
        var queryItems = [URLQueryItem]()
        if let page = page {
            queryItems.append(URLQueryItem(name: "page", value: String(page)))
        }
        if let limit = limit {
            queryItems.append(URLQueryItem(name: "limit", value: String(limit)))
        }
        if let search = search {
            queryItems.append(URLQueryItem(name: "search", value: search))
        }
        urlComponents.queryItems = queryItems.isEmpty ? nil : queryItems
        
        // Create the URL from components
        guard let url = urlComponents.url else {
            completion(.failure(.urlError))
            return
        }
        // Create a URLRequest object
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Add headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(userPreferences.jwt ?? "")", forHTTPHeaderField: "Authorization") // Use your token here
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error{
                completion(.failure(.randomError(error.localizedDescription)))
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Status Code: \(httpResponse.statusCode)")
            }
            
            if let data = data{
                do {
//                    let str = String(decoding: data, as: UTF8.self)
//                    print(str)
                    
                    let decodedResponse = try JSONDecoder().decode(GroupList.self, from: data)

                    let statusCode = decodedResponse.code
                    
                    switch statusCode{
                    case 200:
                        if let groupList = decodedResponse.resources?.data{
                            completion(.success(groupList))
                        }else{
                            completion(.failure(.randomError("200 code but still something went wrong")))
                        }
                    case 400:
                        completion(.failure(.badRequest))
                    case 403:
                        completion(.failure(.accessforbidden))
                    case 422:
                        completion(.failure(.randomError(decodedResponse.message)))
                    case 404:
                        completion(.failure(.unauthorized))
                    default:
                        completion(.failure(.randomError("Something went wrong")))
                    }
                    
                } catch{
                    completion(.failure(.randomError(error.localizedDescription)))
                }
            }else{
                completion(.failure(.noDataError))
                return
            }
        }
        
        task.resume()
        
    }
}
