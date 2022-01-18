//
//  SystemEnteringMobileView.swift
//  SystemEntering
//
//  Created by Александр Александров on 06.01.2022.
//

import Foundation
import UIKit

class SystemEnteringMobileView: LoginSystemBaseView {
    

    
    
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
        labelView.text = "Вход с подтверждением по смс"
        infoLabel.text = "код с подтверждением будет приходить по номеру телефона + 7 982 949 09 93"
        сhangeButton.isHidden = false
    }
    
    @objc func switchViewAction() {
        
        if switchView.isOn {
            print("Tap")
            loginSystemBaseExpandView.isHidden = false
        } else {
            loginSystemBaseExpandView.isHidden = true
            сhangeButton.isHidden = false
        }
    }

}



