//
//  UITableView+Utils.swift
//  RealmTest
//
//  Created by Nanter on 3/7/20.
//  Copyright © 2020 Markiyan Vytrykush. All rights reserved.
//

import UIKit

extension UITableView {

    func getCell<T: UITableViewCell>() -> T {
        return dequeueReusableCell(withIdentifier: String(describing: T.self)) as! T
    }
}
