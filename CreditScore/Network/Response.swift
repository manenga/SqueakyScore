//
//  Response.swift
//  CreditScore
//
//  Created by Manenga Mungandi on 2023/08/12.
//

import Foundation

struct Response<T> {
    let value: T
    let response: URLResponse
}
