//
//  Extension + UIStackView.swift
//  SystemEntering
//
//  Created by Александр Александров on 30.12.2021.
//

import Foundation
import UIKit

extension UIStackView {
    
    func addArrangedSubviews(views: [UIView]) {
        for item in views {
            addArrangedSubview(item)
        }
    }
    
    convenience init(addElement: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat, distribution: UIStackView.Distribution, aligment: UIStackView.Alignment) {
        self.init(arrangedSubviews: addElement)
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
        self.alignment = aligment
    }
    
    public func make(viewsHidden: [UIView], viewsVisible: [UIView], animated: Bool) {
        let viewsHidden = viewsHidden.filter({ $0.superview === self })
        let viewsVisible = viewsVisible.filter({ $0.superview === self })

        let blockToSetVisibility: ([UIView], _ hidden: Bool) -> Void = { views, hidden in
            views.forEach({ $0.isHidden = hidden })
        }

        // need for smooth animation
        let blockToSetAlphaForSubviewsOf: ([UIView], _ alpha: CGFloat) -> Void = { views, alpha in
            views.forEach({ view in
                view.subviews.forEach({ $0.alpha = alpha })
            })
        }

        if !animated {
            blockToSetVisibility(viewsHidden, true)
            blockToSetVisibility(viewsVisible, false)
            blockToSetAlphaForSubviewsOf(viewsHidden, 1)
            blockToSetAlphaForSubviewsOf(viewsVisible, 1)
        } else {
            // update hidden values of all views
            // without that animation doesn't go
            let allViews = viewsHidden + viewsVisible
            self.layer.removeAllAnimations()
            allViews.forEach { view in
                let oldHiddenValue = view.isHidden
                view.layer.removeAllAnimations()
                view.layer.isHidden = oldHiddenValue
            }

            UIView.animate(withDuration: 0.3,
                           delay: 0.0,
                           usingSpringWithDamping: 0.9,
                           initialSpringVelocity: 1,
                           options: [],
                           animations: {

                            blockToSetAlphaForSubviewsOf(viewsVisible, 1)
                            blockToSetAlphaForSubviewsOf(viewsHidden, 0)

                            blockToSetVisibility(viewsHidden, true)
                            blockToSetVisibility(viewsVisible, false)
                            self.layoutIfNeeded()
            },
                           completion: nil)
        }
    }
}
