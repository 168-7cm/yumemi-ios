//
//  APIRequest.swift
//  yumemi-ios
//
//  Created by kou yamamoto on 2021/04/25.
//

import Foundation

protocol APIRequest {
    var baseURL: URL { get }
    var Parameters: [String:String] { get }
}
