//
//  SystemEnteringElectronicSignatureView.swift
//  SystemEntering
//
//  Created by Александр Александров on 06.01.2022.
//

import Foundation
import UIKit

class SystemEnteringElectronicSignatureView: LoginSystemBaseView {
    

    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configurationsView()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurationsView() {
        switchView.addTarget(self, action: #selector(switchViewAction), for: .valueChanged)
        labelView.text = "Вход по электронной подписи"
        infoLabel.text = "доступ к Госуслугам по паролю или с помощью эелектронной подписи"
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
