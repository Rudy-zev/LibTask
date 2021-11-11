//
//  UserService.swift
//  LibTask
//
//  Created by Rudy on 10/11/2021.
//

import Foundation

class UserService {
    private var task: URLSessionDataTask?
    
    private var userSession = URLSession(configuration: .default)
    
    let baseUrl = "http://localhost:8888/LibTaskWebServices"
    
    init(userSession: URLSession) {
        self.userSession = userSession
    }
    
    func checkLogin(parameters: [String: Any], callback: @escaping (Bool, [UserSession]?) -> Void) {
        if let url = URL(string: "http://localhost:8888/LibTaskWebServices/login.php") {
            print("un passage")
            var request = URLRequest(url: url)
            
            var components = URLComponents()
            
            var queryItems = [URLQueryItem]()
            
            for (key, value) in parameters {
                let queryItem = URLQueryItem(name: key, value: String(describing: value))
                queryItems.append(queryItem)
            }
            
            components.queryItems = queryItems
            
            let queryItemData = components.query?.data(using: .utf8)
            
            request.httpBody = queryItemData
            request.httpMethod = "POST"
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
            task?.cancel()
            
            task = userSession.dataTask(with: request) { data, response, error in
                
                let response = response as? HTTPURLResponse
                if response?.statusCode != 200 {
                    callback(false, nil)
                    return
                }
                if let data = data {
                    do {
                        let userSession = try JSONDecoder().decode([UserSession].self, from: data)
                        print(userSession.count)
                        callback(true, userSession)
                    } catch {
                        print(" \(error)")
                        callback(false, nil)
                    }
                    
                } else {
                    callback(false, nil)
                }
            }
            task?.resume()
        } else {
            callback(false, nil)
        }
    }
    
    func getAllUser(callback: @escaping (Bool, [User]?) -> Void) {
        if let url = URL(string: "http://localhost:8888/LibTaskWebServices/allUser.php") {

            var request = URLRequest(url: url)
            request.httpMethod = "post"
            
            task?.cancel()
            
            task = userSession.dataTask(with: request) { data, response, error in
                
                let response = response as? HTTPURLResponse
                if response?.statusCode != 200 {
                    callback(false, nil)
                    return
                }
                if let data = data {
                    do {
                        let allUser = try JSONDecoder().decode([User].self, from: data)
                        print(allUser.count)
                        callback(true, allUser)
                    } catch {
                        print(" \(error)")
                        callback(false, nil)
                    }
                    
                } else {
                    callback(false, nil)
                }
            }
            task?.resume()
        } else {
            callback(false, nil)
        }
    }
    
    func addUser(parameters: [String: Any]) {
        if let url = URL(string: "http://localhost:8888/LibTaskWebServices/addUser.php") {
            var request = URLRequest(url: url)
            
            var components = URLComponents()
            
            var queryItems = [URLQueryItem]()
            
            for (key, value) in parameters {
                let queryItem = URLQueryItem(name: key, value: String(describing: value))
                queryItems.append(queryItem)
            }
            
            components.queryItems = queryItems
            
            let queryItemData = components.query?.data(using: .utf8)
            
            request.httpBody = queryItemData
            request.httpMethod = "POST"
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            
            task?.cancel()
            
            task = userSession.dataTask(with: request)
            task?.resume()
        }
    }
}
