//
//  PickerViewProvider.swift
//  RealmTest
//
//  Created by Nanter on 3/7/20.
//  Copyright © 2020 Markiyan Vytrykush. All rights reserved.
//

import UIKit

class PickerViewProvider: NSObject {

    // MARK: - Outlets

    private weak var pickerView: UIPickerView?

    // MARK: - Properties

    private(set) var currentCategory: CategoryNotes = .job

    // MARK: - Initialization

    init(pickerView: UIPickerView) {
        super.init()

        self.pickerView = pickerView

        self.pickerView?.dataSource = self
        self.pickerView?.delegate = self
    }
}

// MARK: - UIPickerViewDataSource

extension PickerViewProvider: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CategoryNotes.allCases.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CategoryNotes.allCases[row].title
    }
}

// MARK: - UIPickerViewDelegate

extension PickerViewProvider: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentCategory = CategoryNotes.allCases[row]
    }
}
