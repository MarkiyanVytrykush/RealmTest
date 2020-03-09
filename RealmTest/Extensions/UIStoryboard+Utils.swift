//
//  UIStoryboard+Utils.swift
//  RealmTest
//
//  Created by Nanter on 3/8/20.
//  Copyright © 2020 Markiyan Vytrykush. All rights reserved.
//

import UIKit

extension UIStoryboard {

    func getVC<T: UIViewController>() -> T {
        return instantiateViewController(withIdentifier: String(describing: T.self)) as! T
    }
}
