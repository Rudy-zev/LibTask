//
//  ServiceError.swift
//  LibTask
//
//  Created by Rudy on 11/11/2021.
//

import Foundation

enum ServiceError: Error {
    case urlError
    case responseError
    case encodingError
}
