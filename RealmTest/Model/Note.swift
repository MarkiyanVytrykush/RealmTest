//
//  Note.swift
//  RealmTest
//
//  Created by Nanter on 3/7/20.
//  Copyright © 2020 Markiyan Vytrykush. All rights reserved.
//

import RealmSwift

class Note: Object {

    // MARK: - Properties

    @objc private dynamic var categoryIndex: Int

    @objc dynamic var title: String
    @objc dynamic var body: String

    @objc dynamic var isDone = false

    var category: CategoryNotes {
        CategoryNotes(rawValue: categoryIndex)!
    }

    var categoryImage: UIImage {
        return UIImage(named: "\(categoryIndex)")!
    }

    // MARK: - Initialization

    init(title: String, body: String, category: CategoryNotes) {

        self.title = title
        self.body = body
        self.categoryIndex = category.rawValue
    }

    required init() {
        self.title = String()
        self.body = String()
        self.categoryIndex = .zero
    }
}
