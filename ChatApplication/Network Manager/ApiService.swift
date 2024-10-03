//
//  ApiService.swift
//  ChatApplication
//
//  Created by Sarthak Agrawal on 30/09/24.
//

import Foundation

class APIService{
    
    static let shared = APIService()
    let baseUrl = AppConfiguration().apiBaseUrl
    
    
    func login(_ requestBody: UserRequest, completion: @escaping (Result<UserData, APIError>) -> Void ){
        
        guard let url = URL(string: "\(baseUrl)\(Endpoints.login.url)") else {
            completion(.failure(.urlError))
            return
        }
        guard let jsonData = try? JSONEncoder().encode(requestBody) else {
            completion(.failure(.jsonEncodingError))
            return
        }
        print(url)
        print(requestBody)
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
                    let str = String(decoding: data, as: UTF8.self)
                    print(data, "--><--", str)
                    let decodedResponse = try JSONDecoder().decode(AuthResponse.self, from: data)
                    let statusCode = decodedResponse.code
                    
                    switch statusCode{
                    case 200:
                        if let userData = decodedResponse.resources?.data{
                            print(userData)
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
    
    
    
}
