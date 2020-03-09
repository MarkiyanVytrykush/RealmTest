//
//  Array+Utils.swift
//  RealmTest
//
//  Created by Nanter on 3/7/20.
//  Copyright © 2020 Markiyan Vytrykush. All rights reserved.
//

import Foundation

extension Array where Element == Note {
    
    mutating func removeNote(_ note: Note) {
        self = filter { (currentNote) -> Bool in
            currentNote != note
        }
    }
}
