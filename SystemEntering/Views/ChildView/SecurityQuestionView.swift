//
//  SecurityQuestionView.swift
//  SystemEntering
//
//  Created by Александр Александров on 06.01.2022.
//

import Foundation
import UIKit

class SecurityQuestionView: LoginSystemBaseView {
    
    let loginSystemBaseExpandView = LoginSystemBaseExpandView()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        configurationsView()
        actionsBatton()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurationsView() {
        
        loginSystemBaseExpandView.stack1.addArrangedSubviews(views: [loginSystemBaseExpandView.siporatorView2, loginSystemBaseExpandView.stack2])
        
        switchView.addTarget(self, action: #selector(switchViewAction), for: .valueChanged)
        labelView.text = "Контрольный вопрос"
        infoLabel.text = "ответ на контрольный вопрос поможет восстановить учетную запись, если забудите пароль"
        contentStackView.addArrangedSubview(loginSystemBaseExpandView)

    }
    
    func actionsBatton() {
        
        loginSystemBaseExpandView.isHidden = true
        
        loginSystemBaseExpandView.cancelButton.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
        loginSystemBaseExpandView.enableButton.addTarget(self, action: #selector(enableButtonAction), for: .touchUpInside)
    }
    
    
    @objc func switchViewAction() {
        
        if switchView.isOn {
            print("Tap")
            loginSystemBaseExpandView.isHidden = false
            loginSystemBaseExpandView.enableButton.setTitle("включить", for: .normal)

        } else {
            loginSystemBaseExpandView.isHidden = false
            loginSystemBaseExpandView.enableButton.setTitle("выключить", for: .normal)
        }
    }
    
    @objc func cancelButtonAction() {
        loginSystemBaseExpandView.isHidden = true
        switchView.isOn = false
        loginSystemBaseExpandView.textField.text?.removeAll()
    }
    
    @objc func enableButtonAction() {
        if loginSystemBaseExpandView.textField.text == "123" {

            loginSystemBaseExpandView.enableButton.isEnabled = true
            loginSystemBaseExpandView.isHidden = true
            switchView.isOn = true
            сhangeButton.isHidden = true
            loginSystemBaseExpandView.textField.text?.removeAll()
        } else {
            loginSystemBaseExpandView.isHidden = true
            switchView.isOn = false
            loginSystemBaseExpandView.textField.text?.removeAll()
        }
        
    }
}
