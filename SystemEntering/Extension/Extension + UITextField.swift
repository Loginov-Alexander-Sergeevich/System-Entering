//
//  Extension + UITextField.swift
//  SystemEntering
//
//  Created by Александр Александров on 14.01.2022.
//

import Foundation
import UIKit

extension UITextField {
    
    class func textFieldWithInsets(textInset: UIEdgeInsets) -> UITextField {
        return InsettedTextField(textInset: textInset)
    }
}

//private class InsetTextField: UITextField {
//    var insets: UIEdgeInsets
//
//    init(insets: UIEdgeInsets) {
//        self.insets = insets
//        super.init(frame: .zero)
//    }
//
//    required init(coder aDecoder: NSCoder) {
//        fatalError("not intended for use from a NIB")
//    }
//
//    // placeholder position
//    override func textRect(forBounds bounds: CGRect) -> CGRect {
//         return super.textRect(forBounds: bounds.inset(by: insets))
//    }
// 
//    // text position
//    override func editingRect(forBounds bounds: CGRect) -> CGRect {
//         return super.editingRect(forBounds: bounds.inset(by: insets))
//    }
//}

class InsettedTextField: UITextField {

    private let textInset: UIEdgeInsets

    var rightViewInset: CGRect {
        rightView.flatMap { $0.frame } ?? .zero
    }

    var leftViewInset: CGRect {
        leftView.flatMap { $0.frame } ?? .zero
    }

    /// Init the text field with insets.
    init(textInset: UIEdgeInsets) {
        self.textInset = textInset
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds
            .inset(by: textInset)
            .inset(by: UIEdgeInsets(top: 0, left: leftViewInset.width, bottom: 0, right: rightViewInset.width))
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds
            .inset(by: textInset)
            .inset(by: UIEdgeInsets(top: 0, left: leftViewInset.width, bottom: 0, right: rightViewInset.width))
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds
            .inset(by: textInset)
            .inset(by: UIEdgeInsets(top: 0, left: leftViewInset.width, bottom: 0, right: rightViewInset.width))
    }
}
