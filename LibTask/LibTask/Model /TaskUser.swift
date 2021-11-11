//
//  Task.swift
//  LibTask
//
//  Created by Rudy on 09/11/2021.
//

import Foundation

struct TaskUser: Decodable {
    var title: String
    var description: String
    var user: String
    var startingDate: Date?
    var endingDate: Date?
}

