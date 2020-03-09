//
//  NotesTableViewProvider.swift
//  RealmTest
//
//  Created by Nanter on 3/7/20.
//  Copyright © 2020 Markiyan Vytrykush. All rights reserved.
//

import UIKit

typealias NoteCallback = (Note) -> Void

final class NotesTableViewProvider: NSObject {

    // MARK: - Properties

    private weak var tableView: UITableView?

    var didSelectNote: NoteCallback?
    var didRemoveNote: NoteCallback?

    private var dataSource = [Note]() {
        didSet {
            tableView?.reloadData()
        }
    }

    // MARK: - Initialization

    init(tableView: UITableView) {
        super.init()

        self.tableView = tableView

        self.tableView?.dataSource = self
        self.tableView?.delegate = self

        self.tableView?.tableFooterView = UIView()
    }

    // MARK: - Configuration

    func setup(_ dataSource: [Note]) {
        self.dataSource = dataSource
    }
}

// MARK: - UITableViewDataSource

extension NotesTableViewProvider: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NoteTableViewCell = tableView.getCell()
        let note = dataSource[indexPath.row]
        cell.setup(note: note)

        return cell
    }
}

// MARK: - UITableViewDelegate

extension NotesTableViewProvider: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let note = dataSource[indexPath.row]
        didSelectNote?(note)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        let note = dataSource[indexPath.row]
        didRemoveNote?(note)
    }
}
