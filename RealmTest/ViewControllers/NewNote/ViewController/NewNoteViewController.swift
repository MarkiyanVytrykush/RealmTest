//
//  NewNoteViewController.swift
//  RealmTest
//
//  Created by Nanter on 3/7/20.
//  Copyright © 2020 Markiyan Vytrykush. All rights reserved.
//

import UIKit

protocol NewNoteViewControllerDelegate: class {
    func didAddNote(_ note: Note)
}

final class NewNoteViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var bodyTextView: UITextView!
    @IBOutlet private weak var categoryPickerView: UIPickerView!

    // MARK: - Properties

    weak var delegate: NewNoteViewControllerDelegate?

    private var pickerViewProvider: PickerViewProvider!

    private var isValidTitle: Bool {

        let title = titleTextField.text ?? String()
        let isTitleValid = ValidationService.validateLength(text: title, size: (min: 1, max: 64))

        return isTitleValid
    }

    private var isValidDescription: Bool {

        let body =  bodyTextView.text ?? String()
        let isBodyValid = ValidationService.validateLength(text: body, size: (min: 1, max: 264))

        return isBodyValid
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        hideKeyboardWhenTappedAround()
        pickerViewProvider = PickerViewProvider(pickerView: categoryPickerView)
    }

    // MARK: - Private Methods

    private func configureNote() -> Note? {

        guard isValidTitle else {
            presentAlert(message: "Please enter title with lenght more than one symbol and less than 120.",
                         options: "OK")
            return nil
        }

        guard isValidDescription else {
            presentAlert(message: "Please enter description with lenght more than one symbol and less than 264.",
                         options: "OK")
            return nil
        }

        let noteTitle = titleTextField.text!
        let noteBody = bodyTextView.text!
        let category = pickerViewProvider.currentCategory

        return Note(title: noteTitle, body: noteBody, category: category)
    }

    // MARK: - Actions

    @IBAction func doneAction() {
        guard let newNote = configureNote() else { return }
        delegate?.didAddNote(newNote)
        navigationController?.popViewController(animated: true)
    }
}
