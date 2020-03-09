//
//  NotesManager.swift
//  RealmTest
//
//  Created by Nanter on 3/7/20.
//  Copyright © 2020 Markiyan Vytrykush. All rights reserved.
//

import RealmSwift

final class NotesManager {

    // MARK: - Properties

    private let realm = try! Realm()

    // MARK: - Methods

    var notes: [Note] {
        return Array(realm.objects(Note.self)).reversed()
    }

    func saveNote(_ note: Note) {
        try! realm.write {
            realm.add(note)
        }
    }

    func removeAllNotes() {
        try! realm.write {
            realm.deleteAll()
        }
    }

    func removeNote(_ note: Note) {
        try! realm.write {
            realm.delete(note)
        }
    }

    func changeNoteState(_ note: Note, isDone: Bool) {
        try! realm.write {
            note.isDone = isDone
        }
    }
}
