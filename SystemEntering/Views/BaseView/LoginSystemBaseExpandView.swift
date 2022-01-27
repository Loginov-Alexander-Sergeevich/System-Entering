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
    
    
    
    let siporatorView1: UIView = {
        let view = UIView()
        view.layer.backgroundColor = CGColor(gray: 100/110, alpha: 5)
        return view
    }()
    
    let siporatorView2: UIView = {
        let view = UIView()
        view.layer.backgroundColor = CGColor(gray: 100/110, alpha: 5)
        return view
    }()
    
    let siporatorView3: UIView = {
        let view = UIView()
        view.layer.backgroundColor = CGColor(gray: 100/110, alpha: 5)
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
        button.setImage(UIImage(named: "eyes"), for: .normal)
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
    
    let stack1: UIStackView = {
        let stac = UIStackView()
        stac.axis = .vertical
        stac.spacing = 20
        return stac
    }()
    
    let stack2: UIStackView = {
        let stac = UIStackView()
        stac.spacing = 20
        return stac
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
        if textField.text != nil {
            textField.isSecureTextEntry = false
        } else {
            textField.isSecureTextEntry = true
        }
    }
    
    func setView() {
        
        stack1.addArrangedSubviews(views: [siporatorView1, infoLabel, textField])
        stack2.addArrangedSubviews(views: [cancelButton, siporatorView3, enableButton])
        addSubviews(views: [stack1])
    }
    
    func configurationsConstraints() {
        
        battoSecureTextEntry.snp.makeConstraints { make in
            make.width.equalTo(100)
        }
        
        stack1.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        textField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        siporatorView1.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
            make.top.equalToSuperview()
        }
        
        siporatorView2.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        
        siporatorView3.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(1)
            make.bottom.equalToSuperview().inset(15)
            make.centerX.equalToSuperview()
        }
    }
}
