//
//  UIViewController+Navigation.swift
//  RealmTest
//
//  Created by Nanter on 3/7/20.
//  Copyright © 2020 Markiyan Vytrykush. All rights reserved.
//

import UIKit

// MARK: - Navigation

extension UIViewController {

    private var mainStoryboard: UIStoryboard {
        UIStoryboard(name: "Main", bundle: nil)
    }

    func showAddNewNoteViewController() {

        let newNoteViewController: NewNoteViewController = mainStoryboard.getVC()

        newNoteViewController.delegate = self as? NewNoteViewControllerDelegate

        navigationController?.view.layer.add(toTopTransition, forKey: kCATransition)
        navigationController?.pushViewController(newNoteViewController, animated: false)
    }

    func showDetailViewVontroller(for note: Note) {

        let detailsViewModel = DetailsViewModel(note: note)
        let detailViewVontroller: DetailViewController = mainStoryboard.getVC()

        detailViewVontroller.viewModel = detailsViewModel
        detailViewVontroller.delegate = self as? DetailViewControllerDelegate

        navigationController?.pushViewController(detailViewVontroller, animated: true)

    }
}

// MARK: - Utils

extension UIViewController {

    private var toTopTransition: CATransition {

        let transition: CATransition = CATransition()

        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromTop

        return transition
    }

    func presentAlert(title: String? = nil, message: String, options: String..., completion: ((Int) -> Void)? = nil) {

        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { _ in
                completion?(index)
            }))
        }

        self.present(alertController, animated: true, completion: nil)
    }

    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                         action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc
    private func hideKeyboard() {
        view.endEditing(true)
    }
}
