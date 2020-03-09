//
//  NotesListViewModel.swift
//  RealmTest
//
//  Created by Nanter on 3/7/20.
//  Copyright © 2020 Markiyan Vytrykush. All rights reserved.
//

import Foundation

final class NotesListViewModel {

    // MARK: - Properties

    private let notesManager = NotesManager()

    var didDataSourceChanged: (([Note]) -> Void)?

    private(set) var dataSource: [Note] {
        didSet {
            didDataSourceChanged?(dataSource)
        }
    }

    // MARK: - Initialization

    init() {
        dataSource = notesManager.notes
    }

    // MARK: - Methods

    func onAddNewNote(_ note: Note) {
        dataSource.insert(note, at: .zero)
        notesManager.saveNote(note)
    }

    func onChangeNoteState(_ note: Note, isDone: Bool) {
        notesManager.changeNoteState(note, isDone: isDone)
        didDataSourceChanged?(dataSource)
    }

    func onRemoveNote(_ note: Note) {
        dataSource.removeNote(note)
        notesManager.removeNote(note)
    }
}
