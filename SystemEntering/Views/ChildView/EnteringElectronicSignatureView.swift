//
//  EnteringElectronicSignatureView.swift
//  SystemEntering
//
//  Created by Александр Александров on 06.01.2022.
//

import Foundation
import UIKit

class EnteringElectronicSignatureView: LoginSystemBaseView {
    
    let systemEnteringElectronicSignatureView = SystemEnteringElectronicSignatureView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configurationsView()
        actionsBatton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurationsView() {
        systemEnteringElectronicSignatureView.isHidden = true
        switchView.addTarget(self, action: #selector(switchViewAction), for: .valueChanged)
        labelView.text = "Вход по электронной подписи"
        infoLabel.text = "доступ к Госуслугам по паролю или с помощью эелектронной подписи"
        contentStackView.addArrangedSubview(systemEnteringElectronicSignatureView)
        systemEnteringElectronicSignatureView.infoLabel.text = "Введите пароль, что бы подтвердить вход на Госуслуги по электронной подписи"

    }
    
    func actionsBatton() {
        systemEnteringElectronicSignatureView.cancelButton.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
        systemEnteringElectronicSignatureView.enableButton.addTarget(self, action: #selector(enableButtonAction), for: .touchUpInside)
    }
    
    @objc func switchViewAction() {
        if switchView.isOn {
            print("Tap")
            systemEnteringElectronicSignatureView.isHidden = false
            systemEnteringElectronicSignatureView.enableButton.setTitle("включить", for: .normal)

        } else {

            systemEnteringElectronicSignatureView.isHidden = false
            systemEnteringElectronicSignatureView.enableButton.setTitle("выключить", for: .normal)

        }
    }
    
    @objc func cancelButtonAction() {
        systemEnteringElectronicSignatureView.isHidden = true
        switchView.isOn = false
        systemEnteringElectronicSignatureView.textField.text?.removeAll()
    }
    
    @objc func enableButtonAction() {
        if systemEnteringElectronicSignatureView.textField.text == "123" {
            systemEnteringElectronicSignatureView.enableButton.isEnabled = true
            systemEnteringElectronicSignatureView.isHidden = true
            switchView.isOn = true
            сhangeButton.isHidden = true
            systemEnteringElectronicSignatureView.textField.text?.removeAll()
        } else {
            systemEnteringElectronicSignatureView.isHidden = true
            switchView.isOn = false
            systemEnteringElectronicSignatureView.textField.text?.removeAll()
            infoAlert.message  = "Введите какие то данные плученные при входе"
            self.window?.rootViewController?.present(infoAlert, animated: true, completion: nil)
        }
        
    }
}
