//
//  JokesData.swift
//  JokesApp
//
//  Created by Macbook Air on 9.12.2023.
//

import Foundation
struct JokesData :Codable {
    let error : Bool?
    let category: String?
    let type : String?
    let setup : String?
    let delivery: String?
   let id : Int?
}
