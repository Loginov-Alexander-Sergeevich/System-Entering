//
//  ConfirmationView.swift
//  SystemEntering
//
//  Created by Александр Александров on 03.01.2022.
//

import Foundation
import UIKit
import SwiftUI
import Kingfisher

class LoginSystemBaseExpandView: UIView {
    
    let textView: UITextView = {
        let text = UITextView()
        return text
    }()
    
    let siporatorView1: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let siporatorView2: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let siporatorView3: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите пароль, чтобы подтвердить вход на Госуслуги по смс"
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.numberOfLines = 0
        return label
    }()
    
    let battoSecureTextEntry: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "2"), for: .normal)
        return button
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.isSecureTextEntry = true
        textField.layer.backgroundColor = CGColor(gray: 100/110, alpha: 5)
        textField.layer.cornerRadius = 10
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        return textField
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("отменить", for: .normal)
        button.setTitleColor(.red, for: .normal)
        
        return button
    }()
    
    let enableButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("включить", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)

        setView()
        configurationsConstraints()
        
        textField.rightViewMode = .always
        textField.rightView = battoSecureTextEntry
        battoSecureTextEntry.addTarget(self, action: #selector(battoSecureTextEntryAction), for: .touchUpInside)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func battoSecureTextEntryAction() {
        if textField.text != nil{
            textField.isSecureTextEntry = false
        } else {
            textField.isSecureTextEntry = true
        }
    }
    
    func setView() {
        addSubviews(views: [siporatorView1, infoLabel, textField, siporatorView2, siporatorView3, cancelButton, enableButton])
    }

    func configurationsConstraints() {
        
        battoSecureTextEntry.snp.makeConstraints { make in
            make.width.equalTo(100)
        }
        
        siporatorView1.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
            make.top.equalToSuperview()
        }
        
        infoLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(siporatorView1.snp.bottom).offset(20)
        }
        
        textField.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(infoLabel.snp.bottom).offset(20)
        }
        
        siporatorView2.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
            make.top.equalTo(textField.snp.bottom).offset(20)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.top.equalTo(siporatorView2.snp.bottom).offset(20)
            make.trailing.equalTo(siporatorView3.snp.trailing).inset(50)
        }
        
        enableButton.snp.makeConstraints { make in
            make.top.equalTo(siporatorView2.snp.bottom).offset(20)

            make.leading.equalTo(siporatorView3.snp.leading).offset(50)
            
        }
        
        siporatorView3.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(1)
            make.top.equalTo(siporatorView2.snp.bottom).inset(-15)
            make.bottom.equalToSuperview().inset(15)
            make.centerX.equalToSuperview()
        }
        
    }
}
