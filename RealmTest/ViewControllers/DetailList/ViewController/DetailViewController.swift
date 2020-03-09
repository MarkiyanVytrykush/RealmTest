//
//  DetailViewController.swift
//  RealmTest
//
//  Created by Nanter on 3/7/20.
//  Copyright © 2020 Markiyan Vytrykush. All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate: class {
    func didChangedNoteState(_ note: Note, isDone: Bool)
    func didRemovedNote(_ note: Note)
}

class DetailViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet private weak var bodyLabel: UITextView?
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var categoryImageView: UIImageView!

    @IBOutlet private weak var stateSwitcher: UISwitch!

    // MARK: - Properties

    var viewModel: DetailsViewModel!

    weak var delegate: DetailViewControllerDelegate?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    // MARK: - Configuration

    private func setup() {

        title = viewModel.note.title
        bodyLabel?.text = viewModel.note.body

        categoryLabel.text = viewModel.note.category.title
        categoryImageView.image = viewModel.note.category.image

        stateSwitcher.isOn = viewModel.note.isDone
    }

    // MARK: - Actions

    @IBAction private func changeState(_ switcher: UISwitch) {
        delegate?.didChangedNoteState(viewModel.note, isDone: switcher.isOn)
    }

    @IBAction private func removeNote() {
        presentAlert(message: "Remove this item?", options: "Cancel", "OK") {
            if $0 == 1 {
                self.delegate?.didRemovedNote(self.viewModel.note)
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
