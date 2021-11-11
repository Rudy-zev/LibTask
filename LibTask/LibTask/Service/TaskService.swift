//
//  TaskService.swift
//  LibTask
//
//  Created by Rudy on 10/11/2021.
//

import Foundation

class TaskService {
    private var task: URLSessionDataTask?
    
    private var taskSession = URLSession(configuration: .default)
    
    init(taskSession: URLSession) {
        self.taskSession = taskSession
    }
    
    func getAllTask(parameters: [String: Any], callback: @escaping (Bool, [TaskUser]?) -> Void) {
        if let url = URL(string: "http://localhost:8888/LibTaskWebServices/allTask.php") {
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
            
            task = taskSession.dataTask(with: request) { data, response, error in
                
                let response = response as? HTTPURLResponse
                if response?.statusCode != 200 {
                    callback(false, nil)
                    return
                }
                if let data = data {
                    do {
                        let userSession = try JSONDecoder().decode([TaskUser].self, from: data)
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
}
