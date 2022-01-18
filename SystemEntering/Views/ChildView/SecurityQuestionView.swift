//
//  SecurityQuestionView.swift
//  SystemEntering
//
//  Created by Александр Александров on 06.01.2022.
//

import Foundation
import UIKit

class SecurityQuestionView: LoginSystemBaseView {
    
    //let loginSystemBaseExpandView = LoginSystemBaseExpandView()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        configurationsView()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurationsView() {
        switchView.addTarget(self, action: #selector(switchViewAction), for: .valueChanged)
        labelView.text = "Контрольный вопрос"
        infoLabel.text = "ответ на контрольный вопрос поможет восстановить учетную запись, если забудите пароль"
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
