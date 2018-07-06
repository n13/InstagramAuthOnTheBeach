//
//  UIView+LayoutConstraints.swift
//  TestIG
//
//  Created by Nikolaus Heger on 7/3/18.
//  Copyright © 2018 Nikolaus Heger. All rights reserved.
//
import UIKit

extension UIView {
    func _add(_ view: UIView, constraints: [NSLayoutConstraint]) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
}
