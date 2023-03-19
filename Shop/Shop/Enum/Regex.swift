//
//  Regex.swift
//  Shop
//
//  Created by Ильдар on 19.03.2023.
//

import Foundation

enum Regex: String {
    case email =  "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    case name = "^[A-Za-z\\s]{1,20}$"
}
