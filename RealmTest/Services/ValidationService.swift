//
//  ValidationService.swift
//  RealmTest
//
//  Created by Nanter on 3/7/20.
//  Copyright © 2020 Markiyan Vytrykush. All rights reserved.
//

import Foundation

enum ValidationService {
    
    static func validateLength(text: String, size: (min: Int, max: Int)) -> Bool {
        return (size.min...size.max).contains(text.count)
    }
}
