//
//  NotesListViewController.swift
//  RealmTest
//
//  Created by Nanter on 3/7/20.
//  Copyright © 2020 Markiyan Vytrykush. All rights reserved.
//

import UIKit

final class NotesListViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet private weak var notesTableView: UITableView!

    // MARK: - Properties

    private lazy var viewModel = NotesListViewModel()

    private lazy var notesTableViewProvider: NotesTableViewProvider = {

        let provider = NotesTableViewProvider(tableView: notesTableView)

        provider.didSelectNote = { [weak self] in
            self?.showDetailViewVontroller(for: $0)
        }

        provider.didRemoveNote = { [weak self] in
            self?.viewModel.onRemoveNote($0)
        }

        return provider
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        let cellId = String(describing: NoteTableViewCell.self)
        let nib = UINib(nibName: cellId, bundle: nil)
        
        notesTableView.register(nib, forCellReuseIdentifier: cellId)

        notesTableViewProvider.setup(viewModel.dataSource)

        viewModel.didDataSourceChanged = { [weak self] updatedDataSource in
            self?.notesTableViewProvider.setup(updatedDataSource)
        }
    }

    // MARK: - Actions

    @IBAction func addAction() {
        showAddNewNoteViewController()
    }
}

// MARK: - NewNoteViewControllerDelegate

extension NotesListViewController: NewNoteViewControllerDelegate {
    
    func didAddNote(_ note: Note) {
        viewModel.onAddNewNote(note)
    }
}

// MARK: - DetailViewControllerDelegate

extension NotesListViewController: DetailViewControllerDelegate {

    func didChangedNoteState(_ note: Note, isDone: Bool) {
        viewModel.onChangeNoteState(note, isDone: isDone)
    }

    func didRemovedNote(_ note: Note) {
        viewModel.onRemoveNote(note)
    }
}
