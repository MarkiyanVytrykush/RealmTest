//
//  NoteTableViewCell.swift
//  RealmTest
//
//  Created by Nanter on 3/8/20.
//  Copyright © 2020 Markiyan Vytrykush. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var listItemLabel: UILabel!

    // MARK: - Configuration

    func setup(note: Note) {
        accessoryType = note.isDone ? .checkmark : .none
        listItemLabel?.text = note.title
        categoryImage.image =  note.category.image
    }
}
