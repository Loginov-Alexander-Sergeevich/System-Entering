//
//  Extension + UIView.swift
//  SystemEntering
//
//  Created by Александр Александров on 30.12.2021.
//

import Foundation
import UIKit

extension UIView {
    
    func addSubviews(views: [UIView]) {
        for item in views {
            addSubview(item)
        }
    }
}
