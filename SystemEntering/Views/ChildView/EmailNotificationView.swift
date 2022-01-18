//
//  EmailNotificationView.swift
//  SystemEntering
//
//  Created by Александр Александров on 06.01.2022.
//

import Foundation
import UIKit

class EmailNotificationView: LoginSystemBaseView {
    
   // let loginSystemBaseExpandView = LoginSystemBaseExpandView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configurationsView()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurationsView() {
        switchView.addTarget(self, action: #selector(switchViewAction), for: .valueChanged)
        labelView.text = "Оповещение на электронную почту"
        infoLabel.text = "уведомление о входе в Госуслуги будет приходить на электронную почту"
    }
    
    @objc func switchViewAction() {
        
        if switchView.isOn {
            print("Tap")
            loginSystemBaseExpandView.isHidden = false
        } else {
            loginSystemBaseExpandView.isHidden = true
        }
    }
}
