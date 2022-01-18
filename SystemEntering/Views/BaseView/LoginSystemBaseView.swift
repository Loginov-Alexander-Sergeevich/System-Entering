//
//  LoginSystemView.swift
//  SystemEntering
//
//  Created by Александр Александров on 30.12.2021.
//

import Foundation
import UIKit

class LoginSystemBaseView: UIView {
    
    let loginSystemBaseExpandView = LoginSystemBaseExpandView()
    
    let labelView: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    let switchView: UISwitch = {
        let switsch = UISwitch()
        return switsch
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.text = "Text"
        return label
    }()
    
    var сhangeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("изменить", for: .normal)
        button.contentHorizontalAlignment = .leading
        button.isHidden = true
        return button
    }()
    
    var titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.spacing = 10
        return stackView
    }()
    var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        layerView()
        setView()
        actionsBatton()
        configurationConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layerView() {
        
        layer.cornerRadius = 12
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 5
        layer.shouldRasterize = true
        backgroundColor = .white
    }
    
    func actionsBatton() {
        
        loginSystemBaseExpandView.isHidden = true
        
        loginSystemBaseExpandView.cancelButton.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
        loginSystemBaseExpandView.enableButton.addTarget(self, action: #selector(enableButtonAction), for: .touchUpInside)
    }
    
    func setView() {
        
        titleStackView.addArrangedSubview(labelView)
        titleStackView.addArrangedSubview(switchView)
        
        contentStackView.addArrangedSubview(titleStackView)
        contentStackView.addArrangedSubview(infoLabel)
        contentStackView.addArrangedSubview(сhangeButton)
        contentStackView.addArrangedSubview(loginSystemBaseExpandView)
        
        addSubviews(views: [contentStackView])
        
    }
    
    func configurationConstraints() {
        
        contentStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview().inset(25)
        }
    }
    
    
    @objc func cancelButtonAction() {
        loginSystemBaseExpandView.isHidden = true
        switchView.isOn = false
        loginSystemBaseExpandView.textField.text?.removeAll()
    }
    
    @objc func enableButtonAction() {
        loginSystemBaseExpandView.isHidden = true
        switchView.isOn = true
        сhangeButton.isHidden = true
        loginSystemBaseExpandView.textField.text?.removeAll()
    }
}
