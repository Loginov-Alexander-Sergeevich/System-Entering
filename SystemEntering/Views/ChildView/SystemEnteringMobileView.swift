//
//  SystemEnteringMobileView.swift
//  SystemEntering
//
//  Created by Александр Александров on 06.01.2022.
//

import Foundation
import UIKit
import SwiftUI

class SystemEnteringMobileView: LoginSystemBaseView {

    let loginSystemBaseExpandView = LoginSystemBaseExpandView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        actionsBatton()
        configurationsView()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurationsView() {
        
        loginSystemBaseExpandView.stack1.addArrangedSubviews(views: [loginSystemBaseExpandView.siporatorView2, loginSystemBaseExpandView.stack2])
        
        contentStackView.addArrangedSubview(loginSystemBaseExpandView)
        
        loginSystemBaseExpandView.isHidden = true

        switchView.addTarget(self, action: #selector(switchViewAction), for: .valueChanged)
        
        labelView.text = "Вход с подтверждением по смс"
        infoLabel.text = "код с подтверждением будет приходить по номеру телефона + 7 982 949 09 93"
        
        сhangeButton.isHidden = false
    }
    
    func actionsBatton() {
        
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
            сhangeButton.isHidden = false
            loginSystemBaseExpandView.enableButton.setTitle("выключить", for: .normal)
        }
    }
    
    @objc func cancelButtonAction() {
        // Если нажать кнопку "отмена" view должен вернуться в исходное состояние до ее нажатия
        if switchView.isOn {
            loginSystemBaseExpandView.isHidden = true
            switchView.isOn = true
            loginSystemBaseExpandView.textField.text?.removeAll()
        } else {
            loginSystemBaseExpandView.isHidden = true
            switchView.isOn = false
            loginSystemBaseExpandView.textField.text?.removeAll()
        }
        
    }
    
    @objc func enableButtonAction() {
        
        if loginSystemBaseExpandView.textField.text == "123" {
            loginSystemBaseExpandView.enableButton.isEnabled = true
            loginSystemBaseExpandView.isHidden = true
            switchView.isOn = true
            сhangeButton.isHidden = true
            loginSystemBaseExpandView.textField.text?.removeAll()
        } else {
            loginSystemBaseExpandView.isHidden = false
            switchView.isOn = false
            сhangeButton.isHidden = false
            loginSystemBaseExpandView.textField.text?.removeAll()
            self.window?.rootViewController?.present(infoAlert, animated: true, completion: nil)
        }
        
    }

}



