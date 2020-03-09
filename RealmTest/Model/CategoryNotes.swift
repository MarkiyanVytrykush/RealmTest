//
//  CategoryNotes.swift
//  RealmTest
//
//  Created by Nanter on 3/8/20.
//  Copyright © 2020 Markiyan Vytrykush. All rights reserved.
//

import UIKit

enum CategoryNotes: Int {
    case job
    case hobby
    case home
}

extension CategoryNotes: CaseIterable {

    var title: String {
        switch self {
        case .job:
            return "Job"
        case .hobby:
            return "Hobby"
        case .home:
            return "Home"
        }
    }

    var image: UIImage {
        return UIImage(named: "\(title)Icon")!
    }
}
